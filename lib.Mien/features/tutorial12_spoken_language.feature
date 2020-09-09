# File: features/tutorial12_spoken_language.feature
#
# Tutorial 12: Use another Spoken Language
# https://jenisys.github.io/behave.example/tutorials/tutorial12.html
# 
# Goal: Use another spoken language for testing (other than English)
#
# Most BDD frameworks provide internationalisation support. The key part (but
# only the first step) is that the Given ... When ... Then keywords are provided
# in the native language, for example French or German. If this is the case, a
# developer can provide step definitions in another spoken language.
#
# Hint:
# The list of supported languages can be displayed via:
#   behave --lang-list
#
# Feature files can be tagged for a specific language, like:
#   language: de
#   -- file:*.feature
#   ...
#
# When this happens, the BDD framework selects the keywords for this language.
# The default language can be defined in the configuration file. behave uses
# either behave.ini or .behaverc as configuration file:
#
# -- file:behave.ini
# [behave]
# lang = de

# language: de
Funktionalität: Using Languages other than English (tutorial12)

Als Deutscher
will ich BDD-Tests auch in Deutsch schreiben und ausführen.

Szenario: Run a simple test with German Keywords
Angenommen we have behave installed
Wenn we implement a test
Dann behave will test it for us!

Szenario: Run a simple test completely in German
Angenommen wir haben "behave" installiert
Wenn wir einen Test implementieren
Dann wird "behave" ihn für uns testen!