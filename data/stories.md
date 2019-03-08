## story_greet
* greet
- utter_greet

## story_letter
* letter{"letter": "a"}
- utter_letter_input

## story_goodbye
* goodbye
- utter_goodbye
- action_restart

## story_thanks
* thanks
- utter_thanks

## story_deny
* deny
- utter_maybe_next_time

## story_hangman_01
* greet
- utter_greet
* affirm
- form_hangman
- form{"name": "form_hangman"}
- form{"name": null}
- action_restart

## story_hangman_02
* greet
- utter_greet
* deny
- utter_maybe_next_time