resource "kafka_topic" "user_registered" {
  name               = "auth.user-registered.v1"
  partitions         = 3
  replication_factor = 1
}
