#!/bin/sh

# Needed because of the way erlcloud construct SQS endpoints
# from the host, protocol, and queue name by default
# https://docs.localstack.cloud/user-guide/aws/sqs/#queue-urls
export SQS_ENDPOINT_STRATEGY=domain

localstack start
