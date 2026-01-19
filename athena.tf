resource "aws_athena_named_query" "rejected" {
  name     = "${var.name}-rejected-traffic"
  database = "default"
  query    = "SELECT srcaddr, dstaddr, dstport, protocol, count(*) AS hits FROM vpc_flow_logs WHERE action = 'REJECT' GROUP BY 1, 2, 3, 4 ORDER BY hits DESC LIMIT 50;"
}

resource "aws_athena_named_query" "top_talkers" {
  name     = "${var.name}-top-talkers"
  database = "default"
  query    = "SELECT srcaddr, dstaddr, sum(bytes) AS total_bytes FROM vpc_flow_logs GROUP BY 1, 2 ORDER BY total_bytes DESC LIMIT 50;"
}
