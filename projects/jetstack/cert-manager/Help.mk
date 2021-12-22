


########### DO NOT EDIT #############################
# To update call: make add-generated-help-block
# This is added to help document dynamic targets and support shell autocompletion


##@ GIT/Repo Targets
clone-repo:  ## Clone upstream `cert-manager`
checkout-repo: ## Checkout upstream tag based on value in GIT_TAG file

##@ Binary Targets
binaries: ## Build all binaries: `cert-manager-acmesolver cert-manager-cainjector cert-manager-controller cert-manager-webhook` for `linux/amd64 linux/arm64`
_output/bin/cert-manager/linux-amd64/cert-manager-acmesolver: ## Build `_output/bin/cert-manager/linux-amd64/cert-manager-acmesolver`
_output/bin/cert-manager/linux-amd64/cert-manager-cainjector: ## Build `_output/bin/cert-manager/linux-amd64/cert-manager-cainjector`
_output/bin/cert-manager/linux-amd64/cert-manager-controller: ## Build `_output/bin/cert-manager/linux-amd64/cert-manager-controller`
_output/bin/cert-manager/linux-amd64/cert-manager-webhook: ## Build `_output/bin/cert-manager/linux-amd64/cert-manager-webhook`
_output/bin/cert-manager/linux-arm64/cert-manager-acmesolver: ## Build `_output/bin/cert-manager/linux-arm64/cert-manager-acmesolver`
_output/bin/cert-manager/linux-arm64/cert-manager-cainjector: ## Build `_output/bin/cert-manager/linux-arm64/cert-manager-cainjector`
_output/bin/cert-manager/linux-arm64/cert-manager-controller: ## Build `_output/bin/cert-manager/linux-arm64/cert-manager-controller`
_output/bin/cert-manager/linux-arm64/cert-manager-webhook: ## Build `_output/bin/cert-manager/linux-arm64/cert-manager-webhook`

patch-repo: ## Patch upstream repo with patches in patches directory

##@ Image Targets
local-images: ## Builds `cert-manager-acmesolver/images/amd64 cert-manager-cainjector/images/amd64 cert-manager-controller/images/amd64 cert-manager-webhook/images/amd64` as oci tars for presumbit validation
images: ## Pushes `cert-manager-acmesolver/images/push cert-manager-cainjector/images/push cert-manager-controller/images/push cert-manager-webhook/images/push` to IMAGE_REPO
cert-manager-acmesolver/images/amd64: ## Builds/pushes `cert-manager-acmesolver/images/amd64`
cert-manager-cainjector/images/amd64: ## Builds/pushes `cert-manager-cainjector/images/amd64`
cert-manager-controller/images/amd64: ## Builds/pushes `cert-manager-controller/images/amd64`
cert-manager-webhook/images/amd64: ## Builds/pushes `cert-manager-webhook/images/amd64`
cert-manager-acmesolver/images/push: ## Builds/pushes `cert-manager-acmesolver/images/push`
cert-manager-cainjector/images/push: ## Builds/pushes `cert-manager-cainjector/images/push`
cert-manager-controller/images/push: ## Builds/pushes `cert-manager-controller/images/push`
cert-manager-webhook/images/push: ## Builds/pushes `cert-manager-webhook/images/push`

##@ Checksum Targets
checksums: ## Update checksums file based on currently built binaries.
validate-checksums: # Validate checksums of currently built binaries against checksums file.

##@ License Targets
gather-licenses: ## Helper to call $(GATHER_LICENSES_TARGETS) which gathers all licenses
attribution: ## Generates attribution from licenses gathered during `gather-licenses`.
attribution-pr: ## Generates PR to update attribution files for projects

##@ Clean Targets
clean: ## Removes source and _output directory
clean-repo: ## Removes source directory

##@ Helpers
help: ## Display this help
add-generated-help-block: ## Add or update generated help block to document project make file and support shell auto completion

##@ Build Targets
build: ## Called via prow presubmit, calls `validate-checksums local-images attribution attribution-pr `
release: ## Called via prow postsubmit + release jobs, calls `validate-checksums images `
########### END GENERATED ###########################