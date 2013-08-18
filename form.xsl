<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
 
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <link type="text/css" href="css/form.css" rel="stylesheet" />
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
      </head>
      <body>
        <table>
          <tbody>
            <xsl:for-each select="questions">
              <tr>
                <td><xsl:number /></td>
                <td><div><xsl:value-of select="q" /></div></td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <span id="button-bars">
          <input type="button" value="Отправить" id="send" /><input type="button" value="Отчистить" id="clear" />
        </span>
      </body>
        <script>
          /* READY */
          var temp_input = document.createElement('span'),
            adjust = function () {
              var min = 5;
              temp_input.textContent = this.value;
              this.style.width = (temp_input.offsetWidth + 25) + 'px';
            };
          /* SET */
          temp_input.id = "hidden-div";
          document.body.appendChild(temp_input);
          /* GO */
          $('textarea').blur(function () {
            var $this = $(this);
            if (this.value.length > 3) {
              $this.parents('td').prev('td').addClass('filled', 1000);
            } else {
              $this.parents('td').prev('td').removeClass('filled', 1000);
            }
          });
          $('select').change(function () {
            var $this = $(this);
            if (this.value == 'none') {
              this.style.borderColor = 'red';
              $this.next().show('span');
            } else {
              this.style.borderColor = '';
              $this.next().hide('div');
            }
          });
          $('input.field').keydown(adjust).keyup(adjust);
          $('#clear').click(function () {
            if(confirm("Уверены?")) {
              $('textarea').add('input[type="text"]').val('').trigger('blur').trigger('keydown');
            }
          });
        </script>
    </html>
  </xsl:template>
</xsl:stylesheet>
