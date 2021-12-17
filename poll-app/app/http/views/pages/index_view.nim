import json, strformat
import basolato/view
import ../layouts/application_view

proc disabled(status: bool): string =
  if status:
    return "disabled"
  else:
    return ""

proc displaysum(data: seq[JsonNode]): string = 
  var html = "<ul>"
  for node in data:
    var select_item = node["select_item"]
    var count = node["count(select_item)"]
    html &= fmt"""<li>{select_item}の 投票数: {count}</li>"""
  html &= "</ul>"
  return html


proc impl(status: bool, data: seq[JsonNode]):string =
  style "css", style:"""
    <style>
      main{
        display:flex;
      }
      section{
        flex:0 1 auto;
        margin:auto;
      }
    </style>
  """

  script ["idName"], script:"""
    <script>
    </script>
  """

  tmpli html"""
    $(style)
    $(script)
    <main>
      <h1>Let's vote!!</h1><br>
      <section>
        <form method="POST" onsubmit="alert('投票完了!!')">
          $(csrfToken())
          <h2>朝ごはんは?？</h2>
          <input type="radio" name="select_item" value="パン派" $(disabled(status))>パン派           <br>
          <input type="radio" name="select_item" value="ご飯派" $(disabled(status))>ご飯派           <br>
          <input type="radio" name="select_item" value="ステーキ派" $(disabled(status))>ステーキ派      <br>
          <br>
          <input type="submit" value="投票する">
        </form>
        <br>
        <strong>$(displaysum(data))</strong>
      </section>
    </main>
  """

proc indexView*(status: bool, data: seq[JsonNode]):string =
  let title = ""
  return applicationView(title, impl(status, data))
