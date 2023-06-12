#-------------------------Public-route-tabel-----------------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.myigw.id
}

#-------------------------Private-route-tabel-----------------------------
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.mynat.id
}