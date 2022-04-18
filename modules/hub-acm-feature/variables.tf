/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "cluster_name" {
  description = "GCP cluster name used to reach cluster and which becomes the cluster name in the Config Sync kubernetes custom resource."
  type        = string
}

variable "project_id" {
  description = "GCP project_id used to reach cluster."
  type        = string
}

variable "location" {
  description = "GCP location used to reach cluster."
  type        = string
}

variable "create_membership" {
  description = "Create a new membership or reuse an existing one."
  type        = bool
  default     = true
}

variable "enable_fleet_feature" {
  description = "Whether to enable the ACM feature on the fleet."
  type        = bool
  default     = true
}

variable "cluster_membership_id" {
  description = "The hub membership ID to use"
  type        = string
}

# Config Sync
variable "sync_repo" {
  description = "ACM Git repo address"
  type        = string
}

variable "secret_type" {
  description = "git authentication secret type, is passed through to ConfigManagement spec.git.secretType. Overriden to value 'ssh' if `create_ssh_key` is true"
  type        = string
}

variable "sync_branch" {
  description = "ACM repo Git branch. If un-set, uses Config Management default."
  type        = string
  default     = ""
}

variable "sync_revision" {
  description = "ACM repo Git revision. If un-set, uses Config Management default."
  type        = string
  default     = ""
}

variable "policy_dir" {
  description = "Subfolder containing configs in ACM Git repo. If un-set, uses Config Management default."
  type        = string
  default     = ""
}

variable "source_format" {
  description = "Configures a non-hierarchical repo if set to 'unstructured'. Uses [ACM defaults](https://cloud.google.com/anthos-config-management/docs/how-to/installing#configuring-config-management-operator) when unset."
  type        = string
  default     = ""
}

# Credential creation
variable "operator_credential_name" {
  description = "Allows calling modules to specify the name of operator credentials to match what is expected."
  type        = string
  default     = "git-creds"
}

variable "operator_credential_namespace" {
  description = "Allows calling modules to specify the namespace for the operator credential to match what is expected."
  type        = string
  default     = "config-management-system"
}

variable "create_ssh_key" {
  description = "Controls whether a key will be generated for Git authentication"
  type        = bool
  default     = true
}

variable "ssh_auth_key" {
  description = "Key for Git authentication. Overrides 'create_ssh_key' variable. Can be set using 'file(path/to/file)'-function."
  type        = string
  default     = null
}

# Policy Controller
variable "enable_policy_controller" {
  description = "Whether to enable the ACM Policy Controller on the cluster"
  type        = bool
  default     = false
}

variable "install_template_library" {
  description = "Whether to install the default Policy Controller template library"
  type        = bool
  default     = false
}

variable "enable_log_denies" {
  description = "Whether to enable logging of all denies and dryrun failures for ACM Policy Controller."
  type        = bool
  default     = false
}

# Hierarchy Controller config
variable "hierarchy_controller" {
  description = <<EOF
    Configurations for Hierarchy Controller. See [Hierarchy Controller docs](https://cloud.google.com/kubernetes-engine/docs/add-on/config-sync/how-to/installing-hierarchy-controller)
    for more details
  EOF
  type        = map(any)
  default     = null
}
