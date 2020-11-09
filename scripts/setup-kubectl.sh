#!/usr/bin/env bash
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
# limitations under the License

set -o errexit
set -o xtrace

## Run the script as sudo bash setup-kubectl.sh

install_kubectl ()
{
    # Set the version of kubectl binary that will be downloaded
    KUBECTL_VERSION=${1}

    # Download the binary
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(KUBECTL_VERSION)/bin/linux/amd64/kubectl

    # Provide executable permissions to the binary
    chmod +x ./kubectl

    # Move kubectl to known PATH
    mv ./kubectl $HOME/local-kubernetes/bin/kubectl

    # Print the version of kubectl client
    kubectl version --client
}

uninstall_kubectl ()
{
    echo 'Uninstalling kubectl from local machine'
    rm $HOME/local-kubernetes/bin/kubectl
    echo 'Uninstall successful'   
}