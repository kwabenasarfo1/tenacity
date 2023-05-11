variable "region" {
  type = string
  default = "eu-west-2"
  description = "aws region"
}


variable "cidr_block" {
  type = string
  default = "10.0.0.0/16"
  description = "vpc cidr block"
}


variable "instance_tenancy" {
  type = string
  default = "default"
  description = "vpc instance tenancy"
}


variable "enable_dns_hostnames" {
  type = bool
  default = true
  description = "vpc enable dns hostnames"
}


variable "enable_dns_support" {
  type = bool
  default = true
  description = "vpc enable dns support"
}


variable "Prod-pub-sub1_cidr_block" {
  type = string
  default = "10.0.1.0/24"
  description = "public subnet 1 cidr"
}


variable "Prod-pub-sub1_az" {
  type = string
  default = "eu-west-2a"
  description = "public subnet 1 az"
}


variable "Prod-pub-sub2_cidr_block" {
  type = string
  default = "10.0.2.0/24"
  description = "public subnet 2 cidr"
}


variable "Prod-pub-sub2_az" {
  type = string
  default = "eu-west-2b"
  description = "public subnet 2 az"
}


variable "Prod-priv-sub1_cidr_block" {
  type = string
  default = "10.0.3.0/24"
  description = "private subnet 1 cidr"
}


variable "Prod-priv-sub1_az" {
  type = string
  default = "eu-west-2c"
  description = "private subnet 1 az"
}


variable "Prod-priv-sub2_cidr_block" {
  type = string
  default = "10.0.4.0/24"
  description = "private subnet 2 cidr"
}


variable "Prod-priv-sub2_az" {
  type = string
  default = "eu-west-2a"
  description = "private subnet 2 az"
}


variable "Prod-pub-route-table" {
  type = string
  default = "eu-west-2a"
  description = "private subnet 2 az"
}


variable "environment" {
  type = string
  default = "tenacity"
  description = "prefix and tag name for all created resources"
}