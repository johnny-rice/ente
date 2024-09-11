// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a no locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'no';

  static String m0(count) =>
      "${Intl.plural(count, zero: 'Add collaborator', one: 'Add collaborator', other: 'Add collaborators')}";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'Add viewer', one: 'Add viewer', other: 'Add viewers')}";

  static String m9(count) =>
      "${Intl.plural(count, zero: 'Ingen deltakere', one: '1 deltaker', other: '${count} deltakere')}";

  static String m13(user) =>
      "${user} vil ikke kunne legge til flere bilder til dette albumet\n\nDe vil fortsatt kunne fjerne eksisterende bilder lagt til av dem";

  static String m19(count) =>
      "${Intl.plural(count, one: 'Slett ${count} element', other: 'Slett ${count} elementer')}";

  static String m21(albumName) =>
      "Dette fjerner den offentlige lenken for tilgang til \"${albumName}\".";

  static String m22(supportEmail) =>
      "Vennligst send en e-post til ${supportEmail} fra din registrerte e-postadresse";

  static String m24(count, formattedSize) =>
      "${count} filer, ${formattedSize} hver";

  static String m35(count) =>
      "${Intl.plural(count, one: '${count} element', other: '${count} elementer')}";

  static String m36(expiryTime) => "Lenken utløper på ${expiryTime}";

  static String m2(count, formattedCount) =>
      "${Intl.plural(count, zero: 'ingen minner', one: '${formattedCount} minne', other: '${formattedCount} minner')}";

  static String m41(passwordStrengthValue) =>
      "Passordstyrke: ${passwordStrengthValue}";

  static String m3(count) => "${count} valgt";

  static String m51(count, yourCount) => "${count} valgt (${yourCount} dine)";

  static String m52(verificationID) =>
      "Her er min verifiserings-ID: ${verificationID} for ente.io.";

  static String m4(verificationID) =>
      "Hei, kan du bekrefte at dette er din ente.io verifiserings-ID: ${verificationID}";

  static String m54(numberOfPeople) =>
      "${Intl.plural(numberOfPeople, zero: 'Del med bestemte personer', one: 'Delt med 1 person', other: 'Delt med ${numberOfPeople} personer')}";

  static String m65(email) => "Dette er ${email} sin verifiserings-ID";

  static String m69(email) => "Verifiser ${email}";

  static String m70(email) =>
      "Vi har sendt en e-post til <green>${email}</green>";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountWelcomeBack":
            MessageLookupByLibrary.simpleMessage("Velkommen tilbake!"),
        "ackPasswordLostWarning": MessageLookupByLibrary.simpleMessage(
            "Jeg forstår at dersom jeg mister passordet mitt, kan jeg miste dataen min, siden daten er <underline>ende-til-ende-kryptert</underline>."),
        "activeSessions": MessageLookupByLibrary.simpleMessage("Aktive økter"),
        "addANewEmail":
            MessageLookupByLibrary.simpleMessage("Legg til ny e-post"),
        "addCollaborator":
            MessageLookupByLibrary.simpleMessage("Legg til samarbeidspartner"),
        "addCollaborators": m0,
        "addMore": MessageLookupByLibrary.simpleMessage("Legg til flere"),
        "addToHiddenAlbum":
            MessageLookupByLibrary.simpleMessage("Add to hidden album"),
        "addViewer": MessageLookupByLibrary.simpleMessage("Legg til seer"),
        "addViewers": m1,
        "addedAs": MessageLookupByLibrary.simpleMessage("Lagt til som"),
        "advanced": MessageLookupByLibrary.simpleMessage("Avansert"),
        "advancedSettings": MessageLookupByLibrary.simpleMessage("Avansert"),
        "after1Day": MessageLookupByLibrary.simpleMessage("Etter 1 dag"),
        "after1Hour": MessageLookupByLibrary.simpleMessage("Etter 1 time"),
        "after1Month": MessageLookupByLibrary.simpleMessage("Etter 1 måned"),
        "after1Week": MessageLookupByLibrary.simpleMessage("Etter 1 uke"),
        "after1Year": MessageLookupByLibrary.simpleMessage("Etter 1 år"),
        "albumOwner": MessageLookupByLibrary.simpleMessage("Eier"),
        "albumParticipantsCount": m9,
        "albumUpdated": MessageLookupByLibrary.simpleMessage("Album oppdatert"),
        "albums": MessageLookupByLibrary.simpleMessage("Album"),
        "allowAddPhotosDescription": MessageLookupByLibrary.simpleMessage(
            "Tillat folk med lenken å også legge til bilder til det delte albumet."),
        "allowAddingPhotos":
            MessageLookupByLibrary.simpleMessage("Tillat å legge til bilder"),
        "allowDownloads":
            MessageLookupByLibrary.simpleMessage("Tillat nedlastinger"),
        "appLock": MessageLookupByLibrary.simpleMessage("App lock"),
        "apply": MessageLookupByLibrary.simpleMessage("Anvend"),
        "askDeleteReason": MessageLookupByLibrary.simpleMessage(
            "Hva er hovedårsaken til at du sletter kontoen din?"),
        "authToViewYourHiddenFiles": MessageLookupByLibrary.simpleMessage(
            "Vennligst autentiser deg for å se dine skjulte filer"),
        "authToViewYourRecoveryKey": MessageLookupByLibrary.simpleMessage(
            "Vennligst autentiser deg for å se gjennopprettingsnøkkelen din"),
        "autoLock": MessageLookupByLibrary.simpleMessage("Auto lock"),
        "autoLockFeatureDescription": MessageLookupByLibrary.simpleMessage(
            "Time after which the app locks after being put in the background"),
        "cancel": MessageLookupByLibrary.simpleMessage("Avbryt"),
        "cannotAddMorePhotosAfterBecomingViewer": m13,
        "changeEmail":
            MessageLookupByLibrary.simpleMessage("Endre e-postadresse"),
        "changeLocationOfSelectedItems": MessageLookupByLibrary.simpleMessage(
            "Change location of selected items?"),
        "changePasswordTitle":
            MessageLookupByLibrary.simpleMessage("Bytt passord"),
        "changePermissions":
            MessageLookupByLibrary.simpleMessage("Endre tillatelser?"),
        "checkInboxAndSpamFolder": MessageLookupByLibrary.simpleMessage(
            "Sjekk innboksen din (og spam) for å fullføre verifikasjonen"),
        "clearIndexes": MessageLookupByLibrary.simpleMessage("Tøm indekser"),
        "clusteringProgress":
            MessageLookupByLibrary.simpleMessage("Clustering progress"),
        "codeCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Kode kopiert til utklippstavlen"),
        "collaborativeLink":
            MessageLookupByLibrary.simpleMessage("Samarbeidslenke"),
        "collaborator":
            MessageLookupByLibrary.simpleMessage("Samarbeidspartner"),
        "collaboratorsCanAddPhotosAndVideosToTheSharedAlbum":
            MessageLookupByLibrary.simpleMessage(
                "Samarbeidspartnere kan legge til bilder og videoer i det delte albumet."),
        "collect": MessageLookupByLibrary.simpleMessage("Collect"),
        "collectPhotos": MessageLookupByLibrary.simpleMessage("Samle bilder"),
        "collectPhotosDescription": MessageLookupByLibrary.simpleMessage(
            "Create a link where your friends can upload photos in original quality."),
        "confirm": MessageLookupByLibrary.simpleMessage("Bekreft"),
        "confirmAccountDeletion":
            MessageLookupByLibrary.simpleMessage("Bekreft sletting av konto"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Bekreft passordet"),
        "confirmRecoveryKey": MessageLookupByLibrary.simpleMessage(
            "Bekreft gjenopprettingsnøkkel"),
        "confirmYourRecoveryKey": MessageLookupByLibrary.simpleMessage(
            "Bekreft din gjenopprettingsnøkkel"),
        "contactSupport":
            MessageLookupByLibrary.simpleMessage("Kontakt kundestøtte"),
        "contacts": MessageLookupByLibrary.simpleMessage("Contacts"),
        "continueLabel": MessageLookupByLibrary.simpleMessage("Fortsett"),
        "copyLink": MessageLookupByLibrary.simpleMessage("Kopier lenke"),
        "copypasteThisCodentoYourAuthenticatorApp":
            MessageLookupByLibrary.simpleMessage(
                "Kopier og lim inn denne koden\ntil autentiseringsappen din"),
        "createAccount": MessageLookupByLibrary.simpleMessage("Opprett konto"),
        "createAlbumActionHint": MessageLookupByLibrary.simpleMessage(
            "Trykk og holde inne for å velge bilder, og trykk på + for å lage et album"),
        "createCollaborativeLink":
            MessageLookupByLibrary.simpleMessage("Create collaborative link"),
        "createNewAccount":
            MessageLookupByLibrary.simpleMessage("Opprett ny konto"),
        "createPublicLink":
            MessageLookupByLibrary.simpleMessage("Opprett offentlig lenke"),
        "custom": MessageLookupByLibrary.simpleMessage("Egendefinert"),
        "decrypting": MessageLookupByLibrary.simpleMessage("Dekrypterer..."),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("Slett konto"),
        "deleteAccountFeedbackPrompt": MessageLookupByLibrary.simpleMessage(
            "Vi er lei oss for at du forlater oss. Gi oss gjerne en tilbakemelding så vi kan forbedre oss."),
        "deleteAccountPermanentlyButton":
            MessageLookupByLibrary.simpleMessage("Slett bruker for altid"),
        "deleteConfirmDialogBody": MessageLookupByLibrary.simpleMessage(
            "This account is linked to other ente apps, if you use any.\\n\\nYour uploaded data, across all ente apps, will be scheduled for deletion, and your account will be permanently deleted."),
        "deleteEmailRequest": MessageLookupByLibrary.simpleMessage(
            "Vennligst send en e-post til <warning>account-deletion@ente.io</warning> fra din registrerte e-postadresse."),
        "deleteFromBoth":
            MessageLookupByLibrary.simpleMessage("Slett fra begge"),
        "deleteFromDevice":
            MessageLookupByLibrary.simpleMessage("Slett fra enhet"),
        "deleteItemCount": m19,
        "deletePhotos": MessageLookupByLibrary.simpleMessage("Slett bilder"),
        "deleteReason1": MessageLookupByLibrary.simpleMessage(
            "Det mangler en hovedfunksjon jeg trenger"),
        "deleteReason2": MessageLookupByLibrary.simpleMessage(
            "Appen, eller en bestemt funksjon, fungerer ikke slik jeg tror den skal"),
        "deleteReason3": MessageLookupByLibrary.simpleMessage(
            "Jeg fant en annen tjeneste jeg liker bedre"),
        "deleteReason4":
            MessageLookupByLibrary.simpleMessage("Grunnen min er ikke listet"),
        "deleteRequestSLAText": MessageLookupByLibrary.simpleMessage(
            "Forespørselen din vil bli behandlet innen 72 timer."),
        "descriptions": MessageLookupByLibrary.simpleMessage("Descriptions"),
        "deviceLock": MessageLookupByLibrary.simpleMessage("Device lock"),
        "disableDownloadWarningBody": MessageLookupByLibrary.simpleMessage(
            "Seere kan fremdeles ta skjermbilder eller lagre en kopi av bildene dine ved bruk av eksterne verktøy"),
        "disableDownloadWarningTitle":
            MessageLookupByLibrary.simpleMessage("Vær oppmerksom på"),
        "disableLinkMessage": m21,
        "doThisLater":
            MessageLookupByLibrary.simpleMessage("Gjør dette senere"),
        "done": MessageLookupByLibrary.simpleMessage("Ferdig"),
        "dropSupportEmail": m22,
        "duplicateItemsGroup": m24,
        "editLocation": MessageLookupByLibrary.simpleMessage("Edit location"),
        "editsToLocationWillOnlyBeSeenWithinEnte":
            MessageLookupByLibrary.simpleMessage(
                "Edits to location will only be seen within Ente"),
        "email": MessageLookupByLibrary.simpleMessage("E-post"),
        "encryption": MessageLookupByLibrary.simpleMessage("Kryptering"),
        "encryptionKeys":
            MessageLookupByLibrary.simpleMessage("Krypteringsnøkkel"),
        "entePhotosPerm": MessageLookupByLibrary.simpleMessage(
            "Ente <i>trenger tillatelse</i> for å bevare bildene dine"),
        "enterCode": MessageLookupByLibrary.simpleMessage("Angi kode"),
        "enterCodeDescription": MessageLookupByLibrary.simpleMessage(
            "Angi koden fra vennen din for å få gratis lagringsplass for dere begge"),
        "enterEmail": MessageLookupByLibrary.simpleMessage("Skriv inn e-post"),
        "enterNewPasswordToEncrypt": MessageLookupByLibrary.simpleMessage(
            "Angi et nytt passord vi kan bruke til å kryptere dataene dine"),
        "enterPassword": MessageLookupByLibrary.simpleMessage("Angi passord"),
        "enterPasswordToEncrypt": MessageLookupByLibrary.simpleMessage(
            "Angi et passord vi kan bruke til å kryptere dataene dine"),
        "enterPersonName":
            MessageLookupByLibrary.simpleMessage("Enter person name"),
        "enterPin": MessageLookupByLibrary.simpleMessage("Enter PIN"),
        "enterReferralCode":
            MessageLookupByLibrary.simpleMessage("Angi vervekode"),
        "enterThe6digitCodeFromnyourAuthenticatorApp":
            MessageLookupByLibrary.simpleMessage(
                "Skriv inn den 6-sifrede koden fra\ndin autentiseringsapp"),
        "enterValidEmail": MessageLookupByLibrary.simpleMessage(
            "Vennligst skriv inn en gyldig e-postadresse."),
        "enterYourEmailAddress": MessageLookupByLibrary.simpleMessage(
            "Skriv inn e-postadressen din"),
        "enterYourPassword":
            MessageLookupByLibrary.simpleMessage("Angi passordet ditt"),
        "enterYourRecoveryKey": MessageLookupByLibrary.simpleMessage(
            "Skriv inn din gjenopprettingsnøkkel"),
        "expiredLinkInfo": MessageLookupByLibrary.simpleMessage(
            "Denne lenken er utløpt. Vennligst velg en ny utløpstid eller deaktiver lenkeutløp."),
        "faceRecognition":
            MessageLookupByLibrary.simpleMessage("Face recognition"),
        "failedToLoadAlbums":
            MessageLookupByLibrary.simpleMessage("Kunne ikke laste inn album"),
        "familyPlans":
            MessageLookupByLibrary.simpleMessage("Familieabonnementer"),
        "feedback": MessageLookupByLibrary.simpleMessage("Tilbakemelding"),
        "fileTypes": MessageLookupByLibrary.simpleMessage("File types"),
        "forgotPassword": MessageLookupByLibrary.simpleMessage("Glemt passord"),
        "foundFaces": MessageLookupByLibrary.simpleMessage("Found faces"),
        "general": MessageLookupByLibrary.simpleMessage("Generelt"),
        "generatingEncryptionKeys": MessageLookupByLibrary.simpleMessage(
            "Genererer krypteringsnøkler..."),
        "guestView": MessageLookupByLibrary.simpleMessage("Guest view"),
        "guestViewEnablePreSteps": MessageLookupByLibrary.simpleMessage(
            "To enable guest view, please setup device passcode or screen lock in your system settings."),
        "hidden": MessageLookupByLibrary.simpleMessage("Skjult"),
        "hideContent": MessageLookupByLibrary.simpleMessage("Hide content"),
        "hideContentDescriptionAndroid": MessageLookupByLibrary.simpleMessage(
            "Hides app content in the app switcher and disables screenshots"),
        "hideContentDescriptionIos": MessageLookupByLibrary.simpleMessage(
            "Hides app content in the app switcher"),
        "howItWorks":
            MessageLookupByLibrary.simpleMessage("Hvordan det fungerer"),
        "howToViewShareeVerificationID": MessageLookupByLibrary.simpleMessage(
            "Vennligst be dem om å trykke og holde inne på e-postadressen sin på innstillingsskjermen, og bekreft at ID-ene på begge enhetene er like."),
        "immediately": MessageLookupByLibrary.simpleMessage("Immediately"),
        "importing": MessageLookupByLibrary.simpleMessage("Importerer...."),
        "incorrectPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Feil passord"),
        "incorrectRecoveryKeyBody": MessageLookupByLibrary.simpleMessage(
            "Gjennopprettingsnøkkelen du skrev inn er feil"),
        "incorrectRecoveryKeyTitle":
            MessageLookupByLibrary.simpleMessage("Feil gjenopprettingsnøkkel"),
        "indexedItems":
            MessageLookupByLibrary.simpleMessage("Indekserte elementer"),
        "indexingIsPaused": MessageLookupByLibrary.simpleMessage(
            "Indexing is paused, will automatically resume when device is ready"),
        "insecureDevice": MessageLookupByLibrary.simpleMessage("Usikker enhet"),
        "invalidEmailAddress":
            MessageLookupByLibrary.simpleMessage("Ugyldig e-postadresse"),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Ugyldig nøkkel"),
        "invalidRecoveryKey": MessageLookupByLibrary.simpleMessage(
            "Gjenopprettingsnøkkelen du har skrevet inn er ikke gyldig. Kontroller at den inneholder 24 ord og kontroller stavemåten av hvert ord.\n\nHvis du har angitt en eldre gjenopprettingskode, må du kontrollere at den er 64 tegn lang, og kontrollere hvert av dem."),
        "itemCount": m35,
        "joinDiscord": MessageLookupByLibrary.simpleMessage("Join Discord"),
        "keepPhotos": MessageLookupByLibrary.simpleMessage("Behold Bilder"),
        "kindlyHelpUsWithThisInformation": MessageLookupByLibrary.simpleMessage(
            "Vær vennlig og hjelp oss med denne informasjonen"),
        "linkDeviceLimit": MessageLookupByLibrary.simpleMessage("Enhetsgrense"),
        "linkEnabled": MessageLookupByLibrary.simpleMessage("Aktivert"),
        "linkExpired": MessageLookupByLibrary.simpleMessage("Utløpt"),
        "linkExpiresOn": m36,
        "linkExpiry": MessageLookupByLibrary.simpleMessage("Lenkeutløp"),
        "linkHasExpired":
            MessageLookupByLibrary.simpleMessage("Lenken har utløpt"),
        "linkNeverExpires": MessageLookupByLibrary.simpleMessage("Aldri"),
        "localSyncErrorMessage": MessageLookupByLibrary.simpleMessage(
            "Looks like something went wrong since local photos sync is taking more time than expected. Please reach out to our support team"),
        "locations": MessageLookupByLibrary.simpleMessage("Locations"),
        "lockButtonLabel": MessageLookupByLibrary.simpleMessage("Lås"),
        "logInLabel": MessageLookupByLibrary.simpleMessage("Logg inn"),
        "loginTerms": MessageLookupByLibrary.simpleMessage(
            "Ved å klikke Logg inn, godtar jeg <u-terms>brukervilkårene</u-terms> og <u-policy>personvernreglene</u-policy>"),
        "longPressAnEmailToVerifyEndToEndEncryption":
            MessageLookupByLibrary.simpleMessage(
                "Long press an email to verify end to end encryption."),
        "lostDevice": MessageLookupByLibrary.simpleMessage("Mistet enhet?"),
        "machineLearning": MessageLookupByLibrary.simpleMessage("Maskinlæring"),
        "magicSearch": MessageLookupByLibrary.simpleMessage("Magisk søk"),
        "manage": MessageLookupByLibrary.simpleMessage("Administrer"),
        "manageDeviceStorage":
            MessageLookupByLibrary.simpleMessage("Behandle enhetslagring"),
        "manageLink": MessageLookupByLibrary.simpleMessage("Administrer lenke"),
        "manageParticipants":
            MessageLookupByLibrary.simpleMessage("Administrer"),
        "memoryCount": m2,
        "moderateStrength": MessageLookupByLibrary.simpleMessage("Moderat"),
        "modifyYourQueryOrTrySearchingFor":
            MessageLookupByLibrary.simpleMessage(
                "Modify your query, or try searching for"),
        "mostRecent": MessageLookupByLibrary.simpleMessage("Most recent"),
        "mostRelevant": MessageLookupByLibrary.simpleMessage("Most relevant"),
        "moveToHiddenAlbum":
            MessageLookupByLibrary.simpleMessage("Move to hidden album"),
        "movedToTrash":
            MessageLookupByLibrary.simpleMessage("Flyttet til papirkurven"),
        "nameTheAlbum": MessageLookupByLibrary.simpleMessage("Name the album"),
        "never": MessageLookupByLibrary.simpleMessage("Aldri"),
        "newAlbum": MessageLookupByLibrary.simpleMessage("Nytt album"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "noDeviceLimit": MessageLookupByLibrary.simpleMessage("Ingen"),
        "noQuickLinksSelected":
            MessageLookupByLibrary.simpleMessage("No quick links selected"),
        "noRecoveryKey": MessageLookupByLibrary.simpleMessage(
            "Ingen gjenopprettingsnøkkel?"),
        "noRecoveryKeyNoDecryption": MessageLookupByLibrary.simpleMessage(
            "Grunnet vår type ente-til-ende-krypteringsprotokoll kan ikke dine data dekrypteres uten passordet ditt eller gjenopprettingsnøkkelen din"),
        "noSystemLockFound":
            MessageLookupByLibrary.simpleMessage("No system lock found"),
        "notifications": MessageLookupByLibrary.simpleMessage("Varslinger"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "oops": MessageLookupByLibrary.simpleMessage("Oisann"),
        "orPickAnExistingOne":
            MessageLookupByLibrary.simpleMessage("Eller velg en eksisterende"),
        "password": MessageLookupByLibrary.simpleMessage("Passord"),
        "passwordChangedSuccessfully":
            MessageLookupByLibrary.simpleMessage("Passordet ble endret"),
        "passwordLock": MessageLookupByLibrary.simpleMessage("Passordlås"),
        "passwordStrength": m41,
        "passwordStrengthInfo": MessageLookupByLibrary.simpleMessage(
            "Password strength is calculated considering the length of the password, used characters, and whether or not the password appears in the top 10,000 most used passwords"),
        "passwordWarning": MessageLookupByLibrary.simpleMessage(
            "Vi lagrer ikke dette passordet, så hvis du glemmer det, <underline>kan vi ikke dekryptere dataene dine</underline>"),
        "pendingItems":
            MessageLookupByLibrary.simpleMessage("Ventende elementer"),
        "photoGridSize":
            MessageLookupByLibrary.simpleMessage("Bilderutenettstørrelse"),
        "photoSmallCase": MessageLookupByLibrary.simpleMessage("bilde"),
        "pinLock": MessageLookupByLibrary.simpleMessage("PIN lock"),
        "pleaseSelectQuickLinksToRemove": MessageLookupByLibrary.simpleMessage(
            "Please select quick links to remove"),
        "pleaseTryAgain":
            MessageLookupByLibrary.simpleMessage("Vennligst prøv igjen"),
        "pleaseWait": MessageLookupByLibrary.simpleMessage("Vennligst vent..."),
        "privacyPolicyTitle":
            MessageLookupByLibrary.simpleMessage("Personvernserklæring"),
        "publicLinkEnabled":
            MessageLookupByLibrary.simpleMessage("Offentlig lenke aktivert"),
        "recover": MessageLookupByLibrary.simpleMessage("Gjenopprett"),
        "recoverAccount":
            MessageLookupByLibrary.simpleMessage("Gjenopprett konto"),
        "recoverButton": MessageLookupByLibrary.simpleMessage("Gjenopprett"),
        "recoveryKey":
            MessageLookupByLibrary.simpleMessage("Gjenopprettingsnøkkel"),
        "recoveryKeyCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Gjenopprettingsnøkkel kopiert til utklippstavlen"),
        "recoveryKeyOnForgotPassword": MessageLookupByLibrary.simpleMessage(
            "Hvis du glemmer passordet ditt er den eneste måten du kan gjenopprette dataene dine på med denne nøkkelen."),
        "recoveryKeySaveDescription": MessageLookupByLibrary.simpleMessage(
            "Vi lagrer ikke denne nøkkelen, vennligst lagre denne 24-ords nøkkelen på et trygt sted."),
        "recoveryKeySuccessBody": MessageLookupByLibrary.simpleMessage(
            "Flott! Din gjenopprettingsnøkkel er gyldig. Takk for bekreftelsen.\n\nVennligst husk å holde gjenopprettingsnøkkelen din trygt sikkerhetskopiert."),
        "recoveryKeyVerified": MessageLookupByLibrary.simpleMessage(
            "Gjenopprettingsnøkkel bekreftet"),
        "recoveryKeyVerifyReason": MessageLookupByLibrary.simpleMessage(
            "Gjenopprettings nøkkelen er den eneste måten å gjenopprette bildene dine hvis du glemmer passordet ditt. Du kan finne gjenopprettingsnøkkelen din i Innstillinger > Sikkerhet.\n\nVennligst skriv inn gjenopprettingsnøkkelen din her for å bekrefte at du har lagret den riktig."),
        "recoverySuccessful": MessageLookupByLibrary.simpleMessage(
            "Gjenopprettingen var vellykket!"),
        "recreatePasswordBody": MessageLookupByLibrary.simpleMessage(
            "Den gjeldende enheten er ikke kraftig nok til å verifisere passordet ditt, men vi kan regenerere på en måte som fungerer på alle enheter.\n\nVennligst logg inn med gjenopprettingsnøkkelen og regenerer passordet (du kan bruke den samme igjen om du vil)."),
        "recreatePasswordTitle":
            MessageLookupByLibrary.simpleMessage("Gjenopprett passord"),
        "reenterPassword":
            MessageLookupByLibrary.simpleMessage("Re-enter password"),
        "reenterPin": MessageLookupByLibrary.simpleMessage("Re-enter PIN"),
        "referrals": MessageLookupByLibrary.simpleMessage("Vervinger"),
        "remindToEmptyEnteTrash": MessageLookupByLibrary.simpleMessage(
            "Du kan også tømme \"Papirkurven\" for å få den frigjorte lagringsplassen"),
        "remove": MessageLookupByLibrary.simpleMessage("Fjern"),
        "removeLink": MessageLookupByLibrary.simpleMessage("Fjern lenke"),
        "removeParticipant":
            MessageLookupByLibrary.simpleMessage("Fjern deltaker"),
        "removePersonLabel":
            MessageLookupByLibrary.simpleMessage("Remove person label"),
        "removePublicLink":
            MessageLookupByLibrary.simpleMessage("Fjern offentlig lenke"),
        "removePublicLinks":
            MessageLookupByLibrary.simpleMessage("Remove public links"),
        "resendEmail":
            MessageLookupByLibrary.simpleMessage("Send e-posten på nytt"),
        "resetPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Tilbakestill passord"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Lagre nøkkel"),
        "saveYourRecoveryKeyIfYouHaventAlready":
            MessageLookupByLibrary.simpleMessage(
                "Lagre gjenopprettingsnøkkelen hvis du ikke allerede har gjort det"),
        "scanCode": MessageLookupByLibrary.simpleMessage("Skann kode"),
        "scanThisBarcodeWithnyourAuthenticatorApp":
            MessageLookupByLibrary.simpleMessage(
                "Skann denne strekkoden med\nautentiseringsappen din"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "security": MessageLookupByLibrary.simpleMessage("Sikkerhet"),
        "selectALocation":
            MessageLookupByLibrary.simpleMessage("Select a location"),
        "selectALocationFirst":
            MessageLookupByLibrary.simpleMessage("Select a location first"),
        "selectAll": MessageLookupByLibrary.simpleMessage("Velg alle"),
        "selectFoldersForBackup": MessageLookupByLibrary.simpleMessage(
            "Velg mapper for sikkerhetskopiering"),
        "selectReason": MessageLookupByLibrary.simpleMessage("Velg grunn"),
        "selectedFoldersWillBeEncryptedAndBackedUp":
            MessageLookupByLibrary.simpleMessage(
                "Valgte mapper vil bli kryptert og sikkerhetskopiert"),
        "selectedPhotos": m3,
        "selectedPhotosWithYours": m51,
        "sendEmail": MessageLookupByLibrary.simpleMessage("Send e-post"),
        "sendInvite": MessageLookupByLibrary.simpleMessage("Send invitasjon"),
        "sendLink": MessageLookupByLibrary.simpleMessage("Send lenke"),
        "setAPassword": MessageLookupByLibrary.simpleMessage("Lag et passord"),
        "setNewPassword":
            MessageLookupByLibrary.simpleMessage("Set new password"),
        "setNewPin": MessageLookupByLibrary.simpleMessage("Set new PIN"),
        "setPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Lag et passord"),
        "setupComplete":
            MessageLookupByLibrary.simpleMessage("Oppsett fullført"),
        "shareALink": MessageLookupByLibrary.simpleMessage("Del en lenke"),
        "shareMyVerificationID": m52,
        "shareTextConfirmOthersVerificationID": m4,
        "shareWithPeopleSectionTitle": m54,
        "sharedPhotoNotifications":
            MessageLookupByLibrary.simpleMessage("Nye delte bilder"),
        "sharedPhotoNotificationsExplanation": MessageLookupByLibrary.simpleMessage(
            "Motta varsler når noen legger til et bilde i et delt album som du er en del av"),
        "sharing": MessageLookupByLibrary.simpleMessage("Deler..."),
        "showPerson": MessageLookupByLibrary.simpleMessage("Show person"),
        "signUpTerms": MessageLookupByLibrary.simpleMessage(
            "Jeg godtar <u-terms>bruksvilkårene</u-terms> og <u-policy>personvernreglene</u-policy>"),
        "singleFileDeleteHighlight": MessageLookupByLibrary.simpleMessage(
            "Den vil bli slettet fra alle album."),
        "skip": MessageLookupByLibrary.simpleMessage("Hopp over"),
        "someoneSharingAlbumsWithYouShouldSeeTheSameId":
            MessageLookupByLibrary.simpleMessage(
                "Folk som deler album med deg bør se den samme ID-en på deres enhet."),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Noe gikk galt"),
        "somethingWentWrongPleaseTryAgain":
            MessageLookupByLibrary.simpleMessage(
                "Noe gikk galt. Vennligst prøv igjen"),
        "sorry": MessageLookupByLibrary.simpleMessage("Beklager"),
        "sorryWeCouldNotGenerateSecureKeysOnThisDevicennplease":
            MessageLookupByLibrary.simpleMessage(
                "Beklager, vi kunne ikke generere sikre nøkler på denne enheten.\n\nvennligst registrer deg fra en annen enhet."),
        "sort": MessageLookupByLibrary.simpleMessage("Sort"),
        "sparkleSuccess": MessageLookupByLibrary.simpleMessage("✨ Suksess"),
        "status": MessageLookupByLibrary.simpleMessage("Status"),
        "strongStrength": MessageLookupByLibrary.simpleMessage("Sterkt"),
        "tapToCopy":
            MessageLookupByLibrary.simpleMessage("trykk for å kopiere"),
        "tapToEnterCode":
            MessageLookupByLibrary.simpleMessage("Trykk for å angi kode"),
        "tapToUnlock": MessageLookupByLibrary.simpleMessage("Tap to unlock"),
        "terminate": MessageLookupByLibrary.simpleMessage("Avslutte"),
        "terminateSession":
            MessageLookupByLibrary.simpleMessage("Avslutte økten?"),
        "termsOfServicesTitle": MessageLookupByLibrary.simpleMessage("Vilkår"),
        "thisCanBeUsedToRecoverYourAccountIfYou":
            MessageLookupByLibrary.simpleMessage(
                "Dette kan brukes til å gjenopprette kontoen din hvis du mister din andre faktor"),
        "thisDevice": MessageLookupByLibrary.simpleMessage("Denne enheten"),
        "thisIsPersonVerificationId": m65,
        "thisIsYourVerificationId": MessageLookupByLibrary.simpleMessage(
            "Dette er din bekreftelses-ID"),
        "thisWillLogYouOutOfTheFollowingDevice":
            MessageLookupByLibrary.simpleMessage(
                "Dette vil logge deg ut av følgende enhet:"),
        "thisWillLogYouOutOfThisDevice": MessageLookupByLibrary.simpleMessage(
            "Dette vil logge deg ut av denne enheten!"),
        "thisWillRemovePublicLinksOfAllSelectedQuickLinks":
            MessageLookupByLibrary.simpleMessage(
                "This will remove public links of all selected quick links."),
        "toEnableAppLockPleaseSetupDevicePasscodeOrScreen":
            MessageLookupByLibrary.simpleMessage(
                "To enable app lock, please setup device passcode or screen lock in your system settings."),
        "toResetVerifyEmail": MessageLookupByLibrary.simpleMessage(
            "For å tilbakestille passordet ditt, vennligt bekreft e-posten din først."),
        "tooManyIncorrectAttempts":
            MessageLookupByLibrary.simpleMessage("Too many incorrect attempts"),
        "trash": MessageLookupByLibrary.simpleMessage("Papirkurv"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Prøv igjen"),
        "twofactorAuthenticationPageTitle":
            MessageLookupByLibrary.simpleMessage("Tofaktorautentisering"),
        "twofactorSetup":
            MessageLookupByLibrary.simpleMessage("Oppsett av to-faktor"),
        "uncategorized": MessageLookupByLibrary.simpleMessage("Ukategorisert"),
        "unselectAll": MessageLookupByLibrary.simpleMessage("Velg bort alle"),
        "updatingFolderSelection":
            MessageLookupByLibrary.simpleMessage("Oppdaterer mappevalg..."),
        "useRecoveryKey":
            MessageLookupByLibrary.simpleMessage("Bruk gjenopprettingsnøkkel"),
        "verificationId":
            MessageLookupByLibrary.simpleMessage("Verifiserings-ID"),
        "verify": MessageLookupByLibrary.simpleMessage("Bekreft"),
        "verifyEmail":
            MessageLookupByLibrary.simpleMessage("Bekreft e-postadresse"),
        "verifyEmailID": m69,
        "verifyPassword":
            MessageLookupByLibrary.simpleMessage("Bekreft passord"),
        "verifyingRecoveryKey": MessageLookupByLibrary.simpleMessage(
            "Verifiserer gjenopprettingsnøkkel..."),
        "videoSmallCase": MessageLookupByLibrary.simpleMessage("video"),
        "viewRecoveryKey":
            MessageLookupByLibrary.simpleMessage("Vis gjenopprettingsnøkkel"),
        "viewer": MessageLookupByLibrary.simpleMessage("Seer"),
        "weHaveSendEmailTo": m70,
        "weakStrength": MessageLookupByLibrary.simpleMessage("Svakt"),
        "welcomeBack":
            MessageLookupByLibrary.simpleMessage("Velkommen tilbake!"),
        "yesConvertToViewer":
            MessageLookupByLibrary.simpleMessage("Ja, konverter til seer"),
        "yesDelete": MessageLookupByLibrary.simpleMessage("Ja, slett"),
        "you": MessageLookupByLibrary.simpleMessage("Deg"),
        "youCannotShareWithYourself": MessageLookupByLibrary.simpleMessage(
            "Du kan ikke dele med deg selv"),
        "yourAccountHasBeenDeleted": MessageLookupByLibrary.simpleMessage(
            "Brukeren din har blitt slettet"),
        "yourMap": MessageLookupByLibrary.simpleMessage("Your map")
      };
}
