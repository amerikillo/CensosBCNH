/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


jQuery.fn.dataTableExt.aTypes.unshift(
    function ( sData )
    {
        var sValidChars = "0123456789,.";
        var Char;
        var bDecimal = false;
        var iStart=0;
 
        /* Negative sign is valid -  the number check start point */
        if ( sData.charAt(0) === '-' ) {
            iStart = 1;
        }
          
        /* Check the numeric part */
        for ( i=iStart ; i<sData.length ; i++ )
        {
            Char = sData.charAt(i);
            if (sValidChars.indexOf(Char) == -1)
            {
                return null;
            }
        }
          
        return 'numeric-comma';
    }
);