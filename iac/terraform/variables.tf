// Variables to use accross the project
// which can be accessed by var.project_id
variable "project_id" {
  description = "The project ID to host the cluster in"
  default     = "bright-seer-452604-f6"
}

variable "region" {
  description = "The region the cluster in"
  default     = "asia-southeast1"
}

variable "bucket" {
  description = "GCS bucket for MLE course"
  default     = "mle-course123123"
}

variable "ssh_keys" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3h5a9sStpkYrXEWjcXNZuaneAfhK97c6DcpQAg4DJMTk8wmzecvRg2k2I0UHtSmUBx2HpLNcc5mWXhtM7+rWAKvV4vIUou3was7r1xk8UzG/bqffyJBSKv4zuGM9mOYeUPByqBsVuYd5IuDZlBaIRg4VLBzCOM/b/IxTisndtEII/fkEUVDygRPBCqIH8duGY3bxIpQ6k+j/aWYCMhv2hShbyyiijdnRv9exaZxcklo4Zq6COle1UrADE53NxGwUcUttHxAII91mw4W17Sw6KHrLvk5+kllCZ1wzlvnLQATPlkVQsmcYibYoHe/NLB+soadOz6+3ok6TZPn6IUWx9CcOmPXT4ioy1aqAec5aaDJlGW06wZ4cjUn/ijDJSrEfeMUw1aciuNBqDSdeGQ5eYQxXcA8BzcBp1lBQsDq297s07E3HGTMu6D4SdxoTtTlpMSzeHSmuevS5KsqPCUsuXY+r85HS1vVaYIS8pR09HrCfPsM/JBql2ftDP8bkmkOc= longvudang@192.168.12.102"
}

variable "firewall_name" {
  description = "Name of firewall"
  default     = "allow-jelkins-port"
}

variable "disk_size" {
  description = "Boot disk size in GB"
  type        = number
  default     = 50
}

variable "image" {
  description = "OS image for the VM"
  type        = string
  default     = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20230727"
}