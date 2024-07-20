# make a sandbox ec2 instance

module "sandbox" {
    source = "../../modules/ec2"
    name = #name of the instance
    ami = #ami id
    instance_type = #instance type
    key_name = #key name
    subnet_id = var.subnet_id
    security_group_ids = var.security_group_ids
    volume_size = 300
    additional_volume_size = 250
    availability_zone = "${var.region}a"
    tags = var.tags
}
