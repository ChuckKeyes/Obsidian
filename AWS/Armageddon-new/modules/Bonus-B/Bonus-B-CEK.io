<mxfile host="app.diagrams.net">
  <diagram name="Bonus-B CEK (AWS)">
    <mxGraphModel dx="1400" dy="900" grid="1" gridSize="10">
      <root>
        <mxCell id="0"/>
        <mxCell id="1" parent="0"/>

        <!-- Internet -->
        <mxCell id="internet" value="Internet Users"
          style="shape=mxgraph.aws4.user;html=1;"
          vertex="1" parent="1">
          <mxGeometry x="40" y="340" width="80" height="80" as="geometry"/>
        </mxCell>

        <!-- VPC -->
        <mxCell id="vpc" value="VPC (CEK)"
          style="rounded=1;whiteSpace=wrap;html=1;strokeWidth=2;fillColor=#ffffff;"
          vertex="1" parent="1">
          <mxGeometry x="160" y="120" width="1150" height="520" as="geometry"/>
        </mxCell>

        <!-- Public Subnet -->
        <mxCell id="publicSubnet" value="Public Subnet"
          style="rounded=1;whiteSpace=wrap;html=1;fillColor=#f5f5f5;"
          vertex="1" parent="vpc">
          <mxGeometry x="40" y="40" width="480" height="440" as="geometry"/>
        </mxCell>

        <!-- Private Subnet -->
        <mxCell id="privateSubnet" value="Private Subnet"
          style="rounded=1;whiteSpace=wrap;html=1;fillColor=#f5f5f5;"
          vertex="1" parent="vpc">
          <mxGeometry x="560" y="40" width="520" height="440" as="geometry"/>
        </mxCell>

        <!-- ALB -->
        <mxCell id="alb" value="Application Load Balancer
Public | HTTPS"
          style="shape=mxgraph.aws4.application_load_balancer;html=1;"
          vertex="1" parent="publicSubnet">
          <mxGeometry x="160" y="160" width="120" height="120" as="geometry"/>
        </mxCell>

        <!-- WAF -->
        <mxCell id="waf" value="AWS WAFv2"
          style="shape=mxgraph.aws4.waf;html=1;"
          vertex="1" parent="publicSubnet">
          <mxGeometry x="160" y="40" width="120" height="80" as="geometry"/>
        </mxCell>

        <!-- ACM -->
        <mxCell id="acm" value="ACM
TLS Certificate"
          style="shape=mxgraph.aws4.certificate_manager;html=1;"
          vertex="1" parent="publicSubnet">
          <mxGeometry x="160" y="320" width="120" height="80" as="geometry"/>
        </mxCell>

        <!-- Target Group -->
        <mxCell id="tg" value="Target Group
Health Checks"
          style="shape=mxgraph.aws4.target_group;html=1;"
          vertex="1" parent="privateSubnet">
          <mxGeometry x="160" y="160" width="120" height="120" as="geometry"/>
        </mxCell>

        <!-- EC2 -->
        <mxCell id="ec2" value="Private EC2 Instance
App Port 80"
          style="shape=mxgraph.aws4.ec2_instance;html=1;"
          vertex="1" parent="privateSubnet">
          <mxGeometry x="340" y="160" width="120" height="120" as="geometry"/>
        </mxCell>

        <!-- CloudWatch -->
        <mxCell id="cw" value="CloudWatch
Metrics + Dashboard
5XX Alarm"
          style="shape=mxgraph.aws4.cloudwatch;html=1;"
          vertex="1" parent="vpc">
          <mxGeometry x="440" y="500" width="140" height="100" as="geometry"/>
        </mxCell>

        <!-- SNS -->
        <mxCell id="sns" value="SNS
Notifications"
          style="shape=mxgraph.aws4.sns;html=1;"
          vertex="1" parent="vpc">
          <mxGeometry x="640" y="500" width="140" height="100" as="geometry"/>
        </mxCell>

        <!-- Connections -->
        <mxCell id="e1" edge="1" parent="1"
          source="internet" target="alb"
          style="endArrow=block;html=1;">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="e2" edge="1" parent="1"
          source="alb" target="tg"
          style="endArrow=block;html=1;">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="e3" edge="1" parent="1"
          source="tg" target="ec2"
          style="endArrow=block;html=1;">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="e4" edge="1" parent="1"
          source="waf" target="alb"
          style="dashed=1;endArrow=open;html=1;">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="e5" edge="1" parent="1"
          source="acm" target="alb"
          style="dashed=1;endArrow=open;html=1;">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="e6" edge="1" parent="1"
          source="alb" target="cw"
          style="dashed=1;endArrow=open;html=1;">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="e7" edge="1" parent="1"
          source="cw" target="sns"
          style="dashed=1;endArrow=open;html=1;">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
