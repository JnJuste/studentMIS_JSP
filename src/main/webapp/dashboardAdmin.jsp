<%--
  Created by IntelliJ IDEA.
  User: jeanj
  Date: 10/14/2023
  Time: 18:04
  To change this template use File | Settings | File Templates.
--%>
<%@include file="leftNavBar.jsp"%>
<section class="dashboard">
    <%@include file="header.jsp"%>
    <div class="dash-content">
        <div class="overview">
            <div class="title">
                <i class="uil uil-tachometer-fast-alt"></i>
                <span class="text">Dashboard</span>
            </div>

            <div class="boxes">
                <div class="box box1">
                    <i class="uil uil-thumbs-up"></i>
                    <span class="text">Alumni</span>
                    <span class="number">More than 20,000</span>
                </div>
                <div class="box box2">
                    <i class="uil uil-comments"></i>
                    <span class="text">MISSION</span>
                    <span class="number">Christ-center education</span>
                </div>
                <div class="box box3">
                    <i class="uil uil-share"></i>
                    <span class="text">VISION</span>
                    <span class="number">International Center</span>
                </div>
            </div>
            </div>
        </div>
    </div>
</section>
<%@include file="footer.jsp"%>