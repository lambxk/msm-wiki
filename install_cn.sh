#!/bin/bash

# MSM 国内镜像一键安装脚本
# 使用 msm.19930520.xyz 镜像获取版本与二进制包

set -e

MIRROR_BASE="https://msm.19930520.xyz/dl"

# 在临时目录中拉取主安装脚本并执行，保持与官方 install.sh 逻辑一致
main() {
    local tmp_dir
    tmp_dir=$(mktemp -d)
    trap 'rm -rf "$tmp_dir"' EXIT

    local installer_url="https://msm.19930520.xyz/https://raw.githubusercontent.com/msm9527/msm-wiki/refs/heads/main/install.sh"
    echo "[INFO] 获取安装脚本: $installer_url" >&2
    if ! curl -fsSL "$installer_url" -o "$tmp_dir/install.sh"; then
        echo "[ERROR] 无法下载安装脚本" >&2
        exit 1
    fi

    chmod +x "$tmp_dir/install.sh"
    MSM_DL_BASE="$MIRROR_BASE" bash "$tmp_dir/install.sh" "$@"
}

main "$@"

