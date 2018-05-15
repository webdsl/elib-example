application elibexample

imports lib
imports ac

page root(){
  main( "Home" ){
    panel( "Demo Table" ){
      demoTable
    }
    panel( "Demo Form" ){
      demoForm
    }
  }
}

template demoTable(){
  sortedTableBordered( 100 ){
    theader{
      row{
        th{ "String value" }
        th{ "Int value" }
        th{ "WikiText value" }
      }
    }
    for( d: Demo ){
      row{
        column{ output( d.s ) }
        column{ output( d.i ) }
        column{ output( d.t ) }
      }
    }
  }
}

template demoForm(){
  var d := Demo{}
  horizontalForm( "Create entity" ){
    input( "String value", d.s )
    input( "Int value", d.i )
    input( "WikiText value", d.t )
    formActions {
      submit action{ d.save(); }{ "Save" }
    }
  }
}

entity Demo{
  s : String
  i : Int
  t : WikiText
}
