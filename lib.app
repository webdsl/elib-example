module lib

imports elib/elib-bootstrap/lib
imports elib/elib-utils/lib
imports elib/elib-tablesorter/lib

template main( header: String ){
  title{ output( header ) }
  bootstrapIncludes
  navbarResponsive( false ){
    pullRight{
      navItems{
        navItem{ navigate root(){ "Home" } }
      }
    }
  }
  gridContainer{
    if( header != "" ){ pageHeader{ output( header ) } }
    elements
  }
  bootstrapIncludesJS
}

template bootstrapIncludes(){
  includeJS( IncludePaths.jQueryJS() )
  includeCSS( IncludePaths.jQueryUICSS() )
  includeCSS( "bootstrap/css/bootstrap.min.css" )
  tablesorterIncludes()
}

template bootstrapIncludesJS(){
  includeJS( IncludePaths.jQueryUIJS() )
  includeJS( "bootstrap/js/bootstrap.min.js" )
  tooltipsBS
  improveDropdowns
}

template improveDropdowns(){
  head{
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
  }
  <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
  postProcess("$('select').select2();")
}

override template brand(){
  navigate root()[ class="navbar-brand", all attributes ]{ "Elib Example" }
}

template layoutHorizontal(){
  div[ class="form-horizontal" ]{
    elements
  }
}

expand
  Int
  Float
  Long
  Bool
  String
  Text
  WikiText
  Email
  Secret
  Date
  to labelInputOutput
  
expandtemplate labelInputOutput to Type {
  template input( label: String, s: ref Type ){
    controlGroup( label ){
      input( s )[ all attributes ]
      elements
    }
  }
  template output( label: String, s: ref Type ){
    controlGroup( label ){
      div[ class = "output-group" ]{
        output( s )[ all attributes ]
        elements
      }
    }
  }
}
