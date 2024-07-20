#declare all variables metioned in main.tf

variable "ami" {
    description = "The AMI to use for the instance"
    type = string
}

variable "instance_type" {
    description = "The type of instance to launch"
    type = string
}

variable "key_name" {
    description = "The name of the key pair to use for the instance"
    type = string
}

variable "subnet_id" {
    description = "The ID of the subnet to launch the instance in"
    type = string
}

variable "security_group_ids" {
    description = "A list of security group IDs to associate with the instance"
    type = list(string)
}

variable "tags" {
    description = "A map of tags to add to all resources"
    type = map(string)
}

variable "volume_size" {
    description = "The size of the root volume in gigabytes"
    type = number
}

variable "availability_zone" {
    description = "The availability zone to launch the instance in"
    type = string
}

variable "additional_volume_size" {
    description = "The size of the additional volume in gigabytes"
    type = number
}

variable "name" {
    description = "The name to use for all resources"
    type = string
}
