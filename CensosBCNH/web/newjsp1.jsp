<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

    <head profile="http://gmpg.org/xfn/11">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


        <link rel="stylesheet" href="./jshowoff.css" type="text/css" media="screen, projection" />

        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script> 
        <script type="text/javascript" src="./jquery.jshowoff.min.js"></script>

    </head>


    <body id="home">
        <div id="wrap">
            <div id="demo">
                <div id="features">
                    <div><img src="1001/1.JPG" /></div>
                    <div><img src="1001/2.JPG" /></div>
                </div>
                <script type="text/javascript">
                    $(document).ready(function() {
                        $('#features').jshowoff();
                    });
                </script>




            </div><!--end #demo-->


        </div><!--end #wrap-->

        <script type="text/javascript">
            // fix pre overflow in IE
            (function($) {
                $.fn.fixOverflow = function() {
                    if ($.browser.msie) {
                        return this.each(function() {
                            if (this.scrollWidth > this.offsetWidth) {
                                $(this).css({'padding-bottom': '20px', 'overflow-y': 'hidden'});
                            }
                        });
                    } else {
                        return this;
                    }
                };
            })(jQuery);
            $('pre').fixOverflow();
        </script>

    </body>
</html>