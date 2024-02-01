#!/bin/sh


awslocal sqs send-message --queue-url http://localhost:4566/000000000000/LocalSQSQueue1 --message-body "<iq id=\"test-bot1\" to=\"alice@localhost\" from=\"bob@localhost/pc\" tbype=\"get\"><query/></iq>"
awslocal sqs send-message --queue-url http://localhost:4566/000000000000/LocalSQSQueue2 --message-body "<iq id=\"test-bot2\" to=\"alice@localhost\" from=\"bob@localhost/pc\" tbype=\"get\"><query/></iq>"
awslocal sqs send-message --queue-url http://localhost:4566/000000000000/LocalSQSQueue1 --message-body "<iq id=\"test-bot3\" to=\"alice@localhost\" from=\"bob@localhost/pc\" tbype=\"get\"><query/></iq>"
awslocal sqs send-message --queue-url http://localhost:4566/000000000000/LocalSQSQueue2 --message-body "<iq id=\"test-bot4\" to=\"alice@localhost\" from=\"bob@localhost/pc\" tbype=\"get\"><query/></iq>"
awslocal sqs send-message --queue-url http://localhost:4566/000000000000/LocalSQSQueue1 --message-body "<iq id=\"test-bot5\" to=\"alice@localhost\" from=\"bob@localhost/pc\" tbype=\"get\"><query/></iq>"
awslocal sqs send-message --queue-url http://localhost:4566/000000000000/LocalSQSQueue2 --message-body "<iq id=\"test-bot6\" to=\"alice@localhost\" from=\"bob@localhost/pc\" tbype=\"get\"><query/></iq>"
