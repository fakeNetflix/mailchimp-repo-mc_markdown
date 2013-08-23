require 'spec_helper'

describe MCMarkdown::Formatter::Links do

  it "generates a plain link" do
    render_string( "[text](/path)" ).should == "<p><a href='/path'>text</a></p>"
  end

  it "generates a link with a class" do
    render_string( "[text {class}](/path)" ).should == "<p><a href='/path' class='class'>text</a></p>"
  end

  it "generates a link with a target" do
    render_string( "[text _blank](/path)" ).should == "<p><a href='/path' target='_blank'>text</a></p>"
  end

  it "generates a link with a target and a class" do
    render_string( "[text {class} _blank](/path)" ).should == "<p><a href='/path' class='class' target='_blank'>text</a></p>"
  end

  it "respects the no_links option" do
    expect( MCMarkdown.render( "[foo](/bar)", :base, no_links: true ) ).to eq "<p>[foo](/bar)</p>\n"
  end

end