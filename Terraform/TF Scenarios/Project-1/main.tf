# Create EC2 instance
resource "aws_instance" "state_lock_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_pair
  vpc_security_group_ids = [aws_security_group.example_sg.id]
  subnet_id              = aws_subnet.example_subnet1.id
}

# Create Application Load Balancer (ALB)
resource "aws_lb" "state_lock_lb" {
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.example_subnet1.id, aws_subnet.example_subnet2.id]

  tags = {
    Name = "state_lock-load-balancer"
  }
}

# Create target group
resource "aws_lb_target_group" "state_lock_target_group" {
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = "vpc-b5e04ecf"
  target_type = "instance"

  health_check {
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200"
  }

  tags = {
    Name = "state_lock-target-group"
  }
}

# Create listener
resource "aws_lb_listener" "state_lock_listener" {
  load_balancer_arn = aws_lb.state_lock_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.state_lock_target_group.arn
  }
}

# Create auto scaling group
resource "aws_autoscaling_group" "state_lock_asg" {
  name                 = "state_lock-auto-scaling-group"
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  vpc_zone_identifier  = [aws_subnet.example_subnet1.id, aws_subnet.example_subnet2.id]
  launch_configuration = aws_launch_configuration.state_lock_launch_config.name

  tag {
    key                 = "Name"
    value               = "state_lock-auto-scaling-group"
    propagate_at_launch = true
  }
}

# Create launch configuration
resource "aws_launch_configuration" "state_lock_launch_config" {
  name            = "state_lock-launch-config"
  image_id        = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_pair
  security_groups = [aws_security_group.example_sg.id]
}