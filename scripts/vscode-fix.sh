#!/usr/bin/env bash

systemctl --user enable auto-fix-vscode-server.service 
systemctl --user start  auto-fix-vscode-server.service