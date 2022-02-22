


########### DO NOT EDIT #############################
# To update call: make add-generated-help-block
# This is added to help document dynamic targets and support shell autocompletion


##@ GIT/Repo Targets
clone-repo:  ## Clone upstream `cluster-api-provider-vsphere`
checkout-repo: ## Checkout upstream tag based on value in GIT_TAG file
patch-repo: ## Patch upstream repo with patches in patches directory

##@ Binary Targets
binaries: ## Build all binaries: `manager` for `linux/amd64 linux/arm64`
_output/bin/cluster-api-provider-vsphere/linux-amd64/manager: ## Build `_output/bin/cluster-api-provider-vsphere/linux-amd64/manager`
_output/bin/cluster-api-provider-vsphere/linux-arm64/manager: ## Build `_output/bin/cluster-api-provider-vsphere/linux-arm64/manager`

##@ Image Targets
local-images: ## Builds `cluster-api-provider-vsphere/images/amd64` as oci tars for presumbit validation
images: ## Pushes `cluster-api-provider-vsphere/images/push` to IMAGE_REPO
cluster-api-provider-vsphere/images/amd64: ## Builds/pushes `cluster-api-provider-vsphere/images/amd64`
cluster-api-provider-vsphere/images/push: ## Builds/pushes `cluster-api-provider-vsphere/images/push`

##@ Checksum Targets
checksums: ## Update checksums file based on currently built binaries.
validate-checksums: # Validate checksums of currently built binaries against checksums file.

##@ Artifact Targets
tarballs: ## Create tarballs by calling build/lib/simple_create_tarballs.sh unless SIMPLE_CREATE_TARBALLS=false, then tarballs must be defined in project Makefile
s3-artifacts: # Prepare ARTIFACTS_PATH folder structure with tarballs/manifests/other items to be uploaded to s3
upload-artifacts: # Upload tarballs and other artifacts from ARTIFACTS_PATH to S3

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
build: ## Called via prow presubmit, calls `checksums local-images attribution upload-artifacts attribution-pr`
release: ## Called via prow postsubmit + release jobs, calls `checksums images upload-artifacts`
########### END GENERATED ###########################
