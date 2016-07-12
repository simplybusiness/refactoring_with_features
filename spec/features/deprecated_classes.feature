Feature: Deprecated classes

As a developer
I want to raise awareness of deprecated classes
So that we don't build on code we want to refactor when we next modify it
And therefore we "do it right"

Scenario: Modifying a class which is marked as deprecated due to the new support framework
  Given a list of deprecated files
   | file                | sha                                      |
   | app/support/book.rb | f92f8a8e00bbb259b3f26b3ac13d87f1cabb1b05 |
   | app/support/page.rb | fbb220e081f02a185edacf153b6ee04cafb766f1 |

  And a deprecation message:
  """
  Refactor with a goal!
  ======================
  This test fails because you have made a change to one or more files which we would
  like to deprecate in favour of our preferred design approach.

  Please consult with the guidelines here http://example.com/refactor
  or talk to the 'Acme' group within the company for guidance.
  """
  When any of the files is detected as being modified
  Then this test will fail with a deprecation message