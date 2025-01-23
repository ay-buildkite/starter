#!/bin/bash

function generate_number() {
  max_number=${max_number:-9}
  echo $(( $RANDOM % $max_number + 1 ))
}

parallel_index=${1:-}

generated_number=$(generate_number)

if [[ -n "$parallel_index " ]]; then
  ( set -x; buildkite-agent meta-data set "generated-numner::$parallel_index" "${generated_number}" )
else
  ( set -x; buildkite-agent meta-data set "generated-number" "${generated_number}" )
fi

echo
echo
