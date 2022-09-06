
variable "payload_dataquality_analyzers_raw" {
  type = string
}

variable "bucket_name" {
    type = string
}

variable "scripts_glue"{
    type = list(object({
        script_name = string
    }))
}