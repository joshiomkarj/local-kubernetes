# Copyright 2020 Local-Kubernetes Authors.
#
# Copyright 2016 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


KIND_VERSION := v0.9.0


.PHONY: install-kind uninstall-kind install


install-kind:
	@/bin/bash ./scripts/kind.sh install_kind $(KIND_VERSION)

uninstall-kind:
	@/bin/bash ./scripts/kind.sh uninstall_kind

install-kustomize:
	@/bin/bash ./scripts/setup-kustomize.sh install_kustomize

uninstall-kustomize:
	@/bin/bash ./scripts/setup-kustomize.sh uninstall_kustomize

install-kubectl:
	@/bin/bash ./scripts/setup-kubectl.sh install_kubectl

uninstall-kubectl:
	@/bin/bash ./scripts/setup-kubectl.sh uninstall_kubectl