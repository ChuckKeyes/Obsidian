<mxfile host="app.diagrams.net">
  <diagram name="Bonus-B CEK">
    <mxGraphModel dx="1200" dy="800" grid="1" gridSize="10" guides="1">
      <root>
        <mxCell id="0"/>
        <mxCell id="1" parent="0"/>

        <!-- Internet -->
        <mxCell id="internet" value="Internet Users" style="ellipse;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;" vertex="1" parent="1">
          <mxGeometry x="60" y="240" width="140" height="80" as="geometry"/>
        </mxCell>

        <!-- ALB -->
        <mxCell id="alb" value="Public ALB (CEK)\nHTTP → HTTPS\nTLS Termination" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;" vertex="1" parent="1">
          <mxGeometry x="260" y="220" width="220" height="120" as="geometry"/>
        </mxCell>

        <!-- WAF -->
        <mxCell id="waf" value="AWS WAFv2\nManaged Rules" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#f8cecc;strokeColor=#b85450;" vertex="1" parent="1">
          <mxGeometry x="260" y="140" width="220" height="60" as="geometry"/>
        </mxCell>

        <!-- ACM -->
        <mxCell id="acm" value="ACM Certificate\nTLS (443)" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#e1d5e7;strokeColor=#9673a6;" vertex="1" parent="1">
          <mxGeometry x="260" y="360" width="220" height="60" as="geometry"/>
        </mxCell>

        <!-- Target Group -->
        <mxCell id="tg" value="Target Group\nHealth Checks" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;" vertex="1" parent="1">
          <mxGeometry x="560" y="240" width="200" height="100" as="geometry"/>
        </mxCell>

        <!-- Private EC2 -->
        <mxCell id="ec2" value="Private EC2 Instance\nApp Port : 80\nSG allows ALB only" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;" vertex="1" parent="1">
          <mxGeometry x="820" y="240" width="240" height="100" as="geometry"/>
        </mxCell>

        <!-- CloudWatch -->
        <mxCell id="cw" value="CloudWatch\nMetrics + Dashboard\nALB 5XX Alarm" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;" vertex="1" parent="1">
          <mxGeometry x="560" y="80" width="200" height="100" as="geometry"/>
        </mxCell>

        <!-- SNS -->
        <mxCell id="sns" value="SNS Topic\nAlerts / Notifications" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#f8cecc;strokeColor=#b85450;" vertex="1" parent="1">
          <mxGeometry x="560" y="420" width="200" height="80" as="geometry"/>
        </mxCell>

        <!-- Edges -->
        <mxCell id="e1" style="endArrow=block;html=1;" edge="1" parent="1" source="internet" target="alb">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="e2" style="endArrow=block;html=1;" edge="1" parent="1" source="alb" target="tg">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="e3" style="endArrow=block;html=1;" edge="1" parent="1" source="tg" target="ec2">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="e4" style="dashed=1;endArrow=open;html=1;" edge="1" parent="1" source="waf" target="alb">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="e5" style="dashed=1;endArrow=open;html=1;" edge="1" parent="1" source="acm" target="alb">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="e6" style="dashed=1;endArrow=open;html=1;" edge="1" parent="1" source="alb" target="cw">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="e7" style="dashed=1;endArrow=open;html=1;" edge="1" parent="1" source="cw" target="sns">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
