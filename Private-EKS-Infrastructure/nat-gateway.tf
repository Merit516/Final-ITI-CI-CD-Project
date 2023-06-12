#--------------Nat-gateway---------------
resource "aws_nat_gateway" "mynat" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = aws_subnet.pub-sub-1.id
}