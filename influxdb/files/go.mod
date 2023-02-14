module github.com/influxdata/influxdb/v2

go 1.17

replace (
	github.com/AlecAivazis/survey/v2 => github.com/jperkin/survey/v2 v2.3.2-0.20210901161554-6b4ea175889c
	github.com/mattn/go-tty => github.com/mattn/go-tty v0.0.3
	github.com/nats-io/nats-streaming-server v0.11.2 => github.com/influxdata/nats-streaming-server v0.11.3-0.20201112040610-c277f7560803
	github.com/pkg/term => github.com/pkg/term v1.1.0
)
