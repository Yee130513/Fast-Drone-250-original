#!/usr/bin/env bash

set -euo pipefail

if ! command -v rosbag >/dev/null 2>&1; then
  echo "Error: rosbag is not installed or is not available in PATH." >&2
  exit 1
fi

if ! command -v rosnode >/dev/null 2>&1; then
  echo "Error: rosnode is not installed or is not available in PATH." >&2
  exit 1
fi

if ! rosnode list >/dev/null 2>&1; then
  echo "Error: ROS master is not reachable. Start shfiles/run.sh first." >&2
  exit 1
fi

readonly output_dir="${HOME}/hover_test_bags"
if ! mkdir -p "${output_dir}"; then
  echo "Error: cannot create output directory: ${output_dir}" >&2
  exit 1
fi

readonly timestamp="$(date +%Y%m%d_%H%M%S)"
readonly bag_path="${output_dir}/hover_test_${timestamp}.bag"

echo "Recording hover-test data to: ${bag_path}"
echo "Press Ctrl+C after the hover test to stop recording safely."

exec rosbag record --tcpnodelay -O "${bag_path}" \
  /debugPx4ctrl \
  /mavros/setpoint_raw/attitude \
  /vins_fusion/imu_propagate \
  /position_cmd \
  /mavros/imu/data \
  /mavros/battery
