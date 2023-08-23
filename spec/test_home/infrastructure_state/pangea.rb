shared_modules = {
  aws_network: {
    sandboxed: true,
    location: {
      git: {
        repository: %(),
        branch: %(main)
      }
    }
  }
  # network: {
  #   # determines whether to use internal module virtual environment
  #   sandboxed: false,
  #   path: %(src/modules/basic_network)
  # }
}

namespace :nexus, :atavan do
  long  :atavan
  short :at

  unique %(yieb165b)

  modules shared_modules

  environments \
    je: {
      long: :jedha,
      short: :je
    },

    fe: {
      long: :felcine,
      short: :fe
    }

  state_config \
    terraform: {
      s3: {
        dynamodb_table: %(atavan-terraform-lock),
        bucket: %(atavan-terraform-state),
        key: %(atavan/terraform.tfstate),
        region: %(us-west-2),
        encrypt: true
      }
    }
end

# namespace :nexus, :ifrit do
#   long :ifrit
#   short :if
#
#
#   modules shared_modules
#   unique %(yieb165b)
#
#   environments \
#     je: {
#       long: :jedha,
#       short: :je
#     },
#     fe: {
#       long: :felcine,
#       short: :fe
#     }
#
#   state_config \
#     terraform: {
#       s3: {
#         dynamodb_table: %(ifrit-terraform-lock),
#         bucket: %(ifrit-terraform-state),
#         key: %(ifrit/terraform.tfstate),
#         region: %(us-west-2),
#         encrypt: true
#       }
#     }
# end
