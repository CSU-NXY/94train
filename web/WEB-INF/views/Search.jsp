<%--
  Created by IntelliJ IDEA.
  User: nxy
  Date: 17-9-13
  Time: 下午5:09
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/IncludeTop.jsp"/>

<hr>

<!--车票搜索框-->
<div align="center">
    <div class="container">
        <form class="form-inline" action="#">
            <div class="form-group">
                <label for="position">出发地：</label>
                <input class="form-control" id="position" placeholder="出发地" name="position">
            </div>
            <div class="form-group">
                <label for="destination">目的地：</label>
                <input class="form-control" id="destination" placeholder="目的地" name="destination">
            </div>
            <button type="submit" class="btn btn-primary">搜索</button>
        </form>
    </div>
</div>


<div class="row">
    <table class="table">
        <caption>车次信息</caption>
        <thead>
        <tr>
            <th>车次</th>
            <th>出发站</th>
            <th>到达站</th>
            <th>发车时间</th>
            <th>到达时间</th>
            <th>历时</th>
            <th>票价</th>
            <th>票量</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>k12</td>
            <td>长沙</td>
            <td>武汉</td>
            <td>10:16</td>
            <td>12:18</td>
            <td>2小时02分</td>
            <td>20元</td>
            <td>充足</td>
            <td>
                <button type="button" class="btn btn-xs btn-primary">购买</button>
            </td>
        </tr>
        <tr>
            <td>G2633</td>
            <td>长沙</td>
            <td>武汉</td>
            <td>2:23</td>
            <td>3:06</td>
            <td>43分</td>
            <td>65元</td>
            <td>15张</td>
            <td>
                <button type="button" class="btn btn-xs btn-primary">购买</button>
            </td>
        </tr>
        <tr>
            <td>G2506</td>
            <td>长沙</td>
            <td>武汉</td>
            <td>15:37</td>
            <td>16:14</td>
            <td>37分</td>
            <td>65元</td>
            <td>20张</td>
            <td>
                <button type="button" class="btn btn-xs btn-primary">购买</button>
            </td>
        </tr>
        </tbody>
    </table>
    <!--选择页数-->
    <div class="card-footer p-0">
        <nav aria-label="...">
            <ul class="pagination justify-content-end mt-3 mr-3 pull-right">
                <li class="page-item disabled">
                    <span class="page-link">Previous</span>
                </li>
                <li class="page-item active"><span class="page-link">1<span class="sr-only">(current)</span>
                            </span></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li>
            </ul>
        </nav>
    </div>

</div>
</div>

<jsp:include page="common/IncludeBottom.jsp"/>