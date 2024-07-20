variable "tags" {
    description = "A map of tags to add to all resources"
    type = map(string)
}

variable "subnet_id" {
    description = "The subnet id to launch the instance in"
    type = string
}

variable "security_group_ids" {
    description = "The security group ids to attach to the instance"
    type = list(string)
}

variable "region" {
    description = "The region to launch the instance in"
    type = string
}
