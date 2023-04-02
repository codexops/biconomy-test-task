##########################################################################
# AWS Environment
##########################################################################

variable "environment" {
  description = "Development Environment"
  default     = "development"
}

##########################################################################
# AWS Region US-EAST-1 (N. VIRGINIA)
##########################################################################

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

##########################################################################
# AWS Region US-EAST-1 (N. VIRGINIA) Availibilty Zones
##########################################################################

variable "availability_zone-1" {
  description = "Availability zone"
  default     = "us-east-1a"
}

variable "availability_zone-2" {
  description = "Availability zone"
  default     = "us-east-1b"
}

##########################################################################
# AWS Application Name
##########################################################################

variable "application" {
  default     = "biconomy"
  description = "Application name"
}


##########################################################################
# Allowed IP List (Replace with your own IP)
##########################################################################

variable "cluster_allowed_ips" {
  default = ["0.0.0.0/0"]
}
