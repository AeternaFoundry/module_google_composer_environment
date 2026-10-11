variable "composer_environments" {
  description = <<EOT
Map of composer_environments, attributes below
Required:
    - name
Optional:
    - deletion_policy
    - labels
    - project
    - region
    - config (block):
        - data_retention_config (optional, block):
            - airflow_metadata_retention_config (optional, block):
                - retention_days (optional)
                - retention_mode (optional)
            - task_logs_retention_config (optional, block):
                - storage_mode (optional)
        - database_config (optional, block):
            - machine_type (optional)
            - zone (optional)
        - enable_private_builds_only (optional)
        - enable_private_environment (optional)
        - encryption_config (optional, block):
            - kms_key_name (required)
        - environment_size (optional)
        - maintenance_window (optional, block):
            - end_time (required)
            - recurrence (required)
            - start_time (required)
        - master_authorized_networks_config (optional, block):
            - cidr_blocks (optional, block):
                - cidr_block (required)
                - display_name (optional)
            - enabled (required)
        - node_config (optional, block):
            - composer_internal_ipv4_cidr_block (optional)
            - composer_network_attachment (optional)
            - disk_size_gb (optional)
            - enable_ip_masq_agent (optional)
            - ip_allocation_policy (optional, block):
                - cluster_ipv4_cidr_block (optional)
                - cluster_secondary_range_name (optional)
                - services_ipv4_cidr_block (optional)
                - services_secondary_range_name (optional)
                - use_ip_aliases (optional)
            - machine_type (optional)
            - network (optional)
            - oauth_scopes (optional)
            - service_account (optional)
            - subnetwork (optional)
            - tags (optional)
            - zone (optional)
        - node_count (optional)
        - private_environment_config (optional, block):
            - cloud_composer_connection_subnetwork (optional)
            - cloud_composer_network_ipv4_cidr_block (optional)
            - cloud_sql_ipv4_cidr_block (optional)
            - connection_type (optional)
            - enable_private_endpoint (optional)
            - enable_privately_used_public_ips (optional)
            - master_ipv4_cidr_block (optional)
            - web_server_ipv4_cidr_block (optional)
        - recovery_config (optional, block):
            - scheduled_snapshots_config (optional, block):
                - enabled (required)
                - snapshot_creation_schedule (optional)
                - snapshot_location (optional)
                - time_zone (optional)
        - resilience_mode (optional)
        - software_config (optional, block):
            - airflow_config_overrides (optional)
            - cloud_data_lineage_integration (optional, block):
                - enabled (required)
            - env_variables (optional)
            - image_version (optional)
            - pypi_packages (optional)
            - python_version (optional)
            - scheduler_count (optional)
            - web_server_plugins_mode (optional)
        - web_server_config (optional, block):
            - machine_type (required)
        - web_server_network_access_control (optional, block):
            - allowed_ip_range (optional, block):
                - description (optional)
                - value (required)
        - workloads_config (optional, block):
            - dag_processor (optional, block):
                - count (optional)
                - cpu (optional)
                - memory_gb (optional)
                - storage_gb (optional)
            - scheduler (optional, block):
                - count (optional)
                - cpu (optional)
                - memory_gb (optional)
                - storage_gb (optional)
            - triggerer (optional, block):
                - count (required)
                - cpu (required)
                - memory_gb (required)
            - web_server (optional, block):
                - cpu (optional)
                - memory_gb (optional)
                - storage_gb (optional)
            - worker (optional, block):
                - cpu (optional)
                - max_count (optional)
                - memory_gb (optional)
                - min_count (optional)
                - storage_gb (optional)
    - storage_config (block):
        - bucket (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    name            = string
    deletion_policy = optional(string)
    labels          = optional(map(string))
    project         = optional(string)
    region          = optional(string)
    config = optional(object({
      data_retention_config = optional(object({
        airflow_metadata_retention_config = optional(list(object({
          retention_days = optional(number)
          retention_mode = optional(string)
        })))
        task_logs_retention_config = optional(list(object({
          storage_mode = optional(string)
        })))
      }))
      database_config = optional(object({
        machine_type = optional(string)
        zone         = optional(string)
      }))
      enable_private_builds_only = optional(bool)
      enable_private_environment = optional(bool)
      encryption_config = optional(object({
        kms_key_name = string
      }))
      environment_size = optional(string)
      maintenance_window = optional(object({
        end_time   = string
        recurrence = string
        start_time = string
      }))
      master_authorized_networks_config = optional(object({
        cidr_blocks = optional(list(object({
          cidr_block   = string
          display_name = optional(string)
        })))
        enabled = bool
      }))
      node_config = optional(object({
        composer_internal_ipv4_cidr_block = optional(string)
        composer_network_attachment       = optional(string)
        disk_size_gb                      = optional(number)
        enable_ip_masq_agent              = optional(bool)
        ip_allocation_policy = optional(object({
          cluster_ipv4_cidr_block       = optional(string)
          cluster_secondary_range_name  = optional(string)
          services_ipv4_cidr_block      = optional(string)
          services_secondary_range_name = optional(string)
          use_ip_aliases                = optional(bool)
        }))
        machine_type    = optional(string)
        network         = optional(string)
        oauth_scopes    = optional(set(string))
        service_account = optional(string)
        subnetwork      = optional(string)
        tags            = optional(set(string))
        zone            = optional(string)
      }))
      node_count = optional(number)
      private_environment_config = optional(object({
        cloud_composer_connection_subnetwork   = optional(string)
        cloud_composer_network_ipv4_cidr_block = optional(string)
        cloud_sql_ipv4_cidr_block              = optional(string)
        connection_type                        = optional(string)
        enable_private_endpoint                = optional(bool)
        enable_privately_used_public_ips       = optional(bool)
        master_ipv4_cidr_block                 = optional(string)
        web_server_ipv4_cidr_block             = optional(string)
      }))
      recovery_config = optional(object({
        scheduled_snapshots_config = optional(object({
          enabled                    = bool
          snapshot_creation_schedule = optional(string)
          snapshot_location          = optional(string)
          time_zone                  = optional(string)
        }))
      }))
      resilience_mode = optional(string)
      software_config = optional(object({
        airflow_config_overrides = optional(map(string))
        cloud_data_lineage_integration = optional(object({
          enabled = bool
        }))
        env_variables           = optional(map(string))
        image_version           = optional(string)
        pypi_packages           = optional(map(string))
        python_version          = optional(string)
        scheduler_count         = optional(number)
        web_server_plugins_mode = optional(string)
      }))
      web_server_config = optional(object({
        machine_type = string
      }))
      web_server_network_access_control = optional(object({
        allowed_ip_range = optional(list(object({
          description = optional(string)
          value       = string
        })))
      }))
      workloads_config = optional(object({
        dag_processor = optional(object({
          count      = optional(number)
          cpu        = optional(number)
          memory_gb  = optional(number)
          storage_gb = optional(number)
        }))
        scheduler = optional(object({
          count      = optional(number)
          cpu        = optional(number)
          memory_gb  = optional(number)
          storage_gb = optional(number)
        }))
        triggerer = optional(object({
          count     = number
          cpu       = number
          memory_gb = number
        }))
        web_server = optional(object({
          cpu        = optional(number)
          memory_gb  = optional(number)
          storage_gb = optional(number)
        }))
        worker = optional(object({
          cpu        = optional(number)
          max_count  = optional(number)
          memory_gb  = optional(number)
          min_count  = optional(number)
          storage_gb = optional(number)
        }))
      }))
    }))
    storage_config = optional(object({
      bucket = string
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.node_count == null || (v.config.node_count >= 3))
      )
    ])
    error_message = "must be at least 3"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.software_config == null || (v.config.software_config.web_server_plugins_mode == null || (contains(["ENABLED", "DISABLED"], v.config.software_config.web_server_plugins_mode))))
      )
    ])
    error_message = "must be one of: \"ENABLED\", \"DISABLED\""
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.private_environment_config == null || (v.config.private_environment_config.connection_type == null || (contains(["VPC_PEERING", "PRIVATE_SERVICE_CONNECT"], v.config.private_environment_config.connection_type))))
      )
    ])
    error_message = "must be one of: \"VPC_PEERING\", \"PRIVATE_SERVICE_CONNECT\""
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.data_retention_config == null || (v.config.data_retention_config.task_logs_retention_config == null || alltrue([for item in v.config.data_retention_config.task_logs_retention_config : (item.storage_mode == null || (contains(["CLOUD_LOGGING_ONLY", "CLOUD_LOGGING_AND_CLOUD_STORAGE"], item.storage_mode)))])))
      )
    ])
    error_message = "must be one of: \"CLOUD_LOGGING_ONLY\", \"CLOUD_LOGGING_AND_CLOUD_STORAGE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.data_retention_config == null || (v.config.data_retention_config.airflow_metadata_retention_config == null || alltrue([for item in v.config.data_retention_config.airflow_metadata_retention_config : (item.retention_mode == null || (contains(["RETENTION_MODE_ENABLED", "RETENTION_MODE_DISABLED"], item.retention_mode)))])))
      )
    ])
    error_message = "must be one of: \"RETENTION_MODE_ENABLED\", \"RETENTION_MODE_DISABLED\""
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.data_retention_config == null || (v.config.data_retention_config.airflow_metadata_retention_config == null || alltrue([for item in v.config.data_retention_config.airflow_metadata_retention_config : (item.retention_days == null || (item.retention_days >= 30 && item.retention_days <= 730))])))
      )
    ])
    error_message = "must be between 30 and 730"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.workloads_config == null || (v.config.workloads_config.scheduler == null || (v.config.workloads_config.scheduler.cpu == null || (v.config.workloads_config.scheduler.cpu >= 0))))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.workloads_config == null || (v.config.workloads_config.scheduler == null || (v.config.workloads_config.scheduler.memory_gb == null || (v.config.workloads_config.scheduler.memory_gb >= 0))))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.workloads_config == null || (v.config.workloads_config.scheduler == null || (v.config.workloads_config.scheduler.storage_gb == null || (v.config.workloads_config.scheduler.storage_gb >= 0))))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.workloads_config == null || (v.config.workloads_config.scheduler == null || (v.config.workloads_config.scheduler.count == null || (v.config.workloads_config.scheduler.count >= 0))))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.workloads_config == null || (v.config.workloads_config.triggerer == null || (v.config.workloads_config.triggerer.cpu >= 0)))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.workloads_config == null || (v.config.workloads_config.triggerer == null || (v.config.workloads_config.triggerer.memory_gb >= 0)))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.workloads_config == null || (v.config.workloads_config.triggerer == null || (v.config.workloads_config.triggerer.count >= 0)))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.workloads_config == null || (v.config.workloads_config.web_server == null || (v.config.workloads_config.web_server.cpu == null || (v.config.workloads_config.web_server.cpu >= 0))))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.workloads_config == null || (v.config.workloads_config.web_server == null || (v.config.workloads_config.web_server.memory_gb == null || (v.config.workloads_config.web_server.memory_gb >= 0))))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.workloads_config == null || (v.config.workloads_config.web_server == null || (v.config.workloads_config.web_server.storage_gb == null || (v.config.workloads_config.web_server.storage_gb >= 0))))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.workloads_config == null || (v.config.workloads_config.worker == null || (v.config.workloads_config.worker.cpu == null || (v.config.workloads_config.worker.cpu >= 0))))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.workloads_config == null || (v.config.workloads_config.worker == null || (v.config.workloads_config.worker.memory_gb == null || (v.config.workloads_config.worker.memory_gb >= 0))))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.workloads_config == null || (v.config.workloads_config.worker == null || (v.config.workloads_config.worker.storage_gb == null || (v.config.workloads_config.worker.storage_gb >= 0))))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.workloads_config == null || (v.config.workloads_config.worker == null || (v.config.workloads_config.worker.min_count == null || (v.config.workloads_config.worker.min_count >= 0))))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.workloads_config == null || (v.config.workloads_config.worker == null || (v.config.workloads_config.worker.max_count == null || (v.config.workloads_config.worker.max_count >= 0))))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.workloads_config == null || (v.config.workloads_config.dag_processor == null || (v.config.workloads_config.dag_processor.cpu == null || (v.config.workloads_config.dag_processor.cpu >= 0))))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.workloads_config == null || (v.config.workloads_config.dag_processor == null || (v.config.workloads_config.dag_processor.memory_gb == null || (v.config.workloads_config.dag_processor.memory_gb >= 0))))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.workloads_config == null || (v.config.workloads_config.dag_processor == null || (v.config.workloads_config.dag_processor.storage_gb == null || (v.config.workloads_config.dag_processor.storage_gb >= 0))))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.workloads_config == null || (v.config.workloads_config.dag_processor == null || (v.config.workloads_config.dag_processor.count == null || (v.config.workloads_config.dag_processor.count >= 0 && v.config.workloads_config.dag_processor.count <= 3))))
      )
    ])
    error_message = "must be between 0 and 3"
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.environment_size == null || (contains(["ENVIRONMENT_SIZE_SMALL", "ENVIRONMENT_SIZE_MEDIUM", "ENVIRONMENT_SIZE_LARGE", "ENVIRONMENT_SIZE_EXTRA_LARGE"], v.config.environment_size)))
      )
    ])
    error_message = "must be one of: \"ENVIRONMENT_SIZE_SMALL\", \"ENVIRONMENT_SIZE_MEDIUM\", \"ENVIRONMENT_SIZE_LARGE\", \"ENVIRONMENT_SIZE_EXTRA_LARGE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.composer_environments : (
        v.config == null || (v.config.resilience_mode == null || (contains(["STANDARD_RESILIENCE", "HIGH_RESILIENCE"], v.config.resilience_mode)))
      )
    ])
    error_message = "must be one of: \"STANDARD_RESILIENCE\", \"HIGH_RESILIENCE\""
  }
  # Note: 8 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

