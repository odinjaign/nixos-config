#!/usr/bin/env bash

systemctl --user enable auto-fix-vscode-server.service --quiet
systemctl --user start  auto-fix-vscode-server.service
systemctl --user is-enabled auto-fix-vscode-server.service
systemctl --user is-active auto-fix-vscode-server.service