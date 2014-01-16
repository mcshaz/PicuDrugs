<%@ Page Language="C#" %>
<script runat="server">
  protected override void OnLoad(EventArgs e)
  {
      Response.RedirectPermanent("EnterPtData.aspx");
      base.OnLoad(e);
  }
</script>