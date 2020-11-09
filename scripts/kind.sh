#!/bin/bash

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

install_kind ()
{
    echo 'Started installing kind...'
    echo

    # Download kind #
    echo 'Downloading kind...'

    curl -Lo ./kind https://kind.sigs.k8s.io/dl/${1}/kind-linux-amd64

    echo 'Kind downloaded successfully.'
    echo
    # Download kind complete #

    # Provide executable permission to kind binary #
    echo 'Making kind binary executable'
    chmod +x ./kind

    # Create a directory in $HOME for kind binary
    echo 'Creating local-kubernetes directory'
    mkdir -p $HOME/local-kubernetes/bin

    # Move kind to local-kubernetes directory
    echo 'Moving kind to local kubernetes directory'
    mv ./kind $HOME/local-kubernetes/bin/kind

    echo 'Setting up PATH'
    export PATH=$HOME/local-kubernetes/bin/:$PATH

    echo 'Adding PATH configuration to your .profile file'
    echo 'export PATH=$HOME/local-kubernetes/:$PATH' > $HOME/.alias_rc

    echo
    echo 'Kind installed successfully'
}

uninstall_kind ()
{
    echo 'Uninstalling kind from local machine'
    rm $HOME/local-kubernetes/kind
    echo 'Uninstall successful'
}