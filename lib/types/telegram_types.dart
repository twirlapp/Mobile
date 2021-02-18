enum CallDiscardReason {
  declined,
  disconnected,
  empty,
  hungUp,
  missed
}
enum KeyboardButtonType {
  keyboardButtonTypeRequestLocation,
  keyboardButtonTypeRequestPhoneNumber,
  keyboardButtonTypeText
}

enum PassportElementType {
  address,
  bankStatement,
  driverLicense,
  emailAddress,
  identityCard,
  internalPassport,
  passport,
  passportRegistration,
  personalDetails,
  phoneNumber,
  rentalAgreement,
  temporaryRegistration,
  utilityBill
}

enum TextEntityType {
  bold,
  botCommand,
  cashTag,
  code,
  emailAddress,
  hashTag,
  italic,
  mention,
  name,
  phoneNumber,
  pre,
  preCode,
  textUrl,
  url
}

class LocalFile {
  String path;
  bool canDownload;
  bool canBeDeleted;
  bool isDownloadingActive;
  bool isDownloadingCompleted;
  int downloadPrefixSize;
  int downloadSize;

  LocalFile({this.path, this.canDownload = true, this.canBeDeleted = true,
    this.isDownloadingActive = false, this.isDownloadingCompleted = true,
    this.downloadPrefixSize, this.downloadSize});

}

class RemoteFile {
  int id;
  bool isUploadingActive;
  bool isUploadingComplete;
  int uploadedSize;

  RemoteFile({this.id, this.isUploadingActive = false, this.isUploadingComplete = false, this.uploadedSize = 0});
}

class File {
  int id;
  int size;
  int expectedSize;
  LocalFile localFile;
  RemoteFile remoteFile;

  File({this.id, this.size, this.expectedSize, this.localFile, this.remoteFile});
}

abstract class InputFile {}

class InputFileGenerated implements InputFile {
  String originalPath;
  String conversion;
  int expectedSize;

  InputFileGenerated(this.originalPath, this.conversion, this.expectedSize);
}

class InputFileId implements InputFile {
  int fileId;

  InputFileId(this.fileId);
}

class InputFileLocal implements InputFile {
  String path;

  InputFileLocal(this.path);
}

class InputFileRemote implements InputFile {
  String id;

  InputFileRemote(this.id);
}

class InputThumbnail {
  InputFile thumbnail;
  int width;
  int height;

  InputThumbnail(this.thumbnail, this.width, this.height);
}

abstract class InputMessageContent {}

class InputMessageAnimation implements InputMessageContent {
  InputFile animation;
  InputThumbnail thumbnail;
  int duration;
  int width;
  int height;
  FormattedText caption;

  InputMessageAnimation(this.animation, {this.thumbnail, this.duration,
    this.width, this.height, this.caption});
}

class InputMessageAudio implements InputMessageContent {
  InputFile audio;
  InputThumbnail thumbnail;
  int duration;
  String title;
  String performer;
  FormattedText caption;

  InputMessageAudio(this.audio, this.duration, this.title,
      {this.thumbnail, this.performer, this.caption});
}

class InputMessageContact implements InputMessageContent {
  Contact contact;

  InputMessageContact(this.contact);
}

class InputMessageDocument implements InputMessageContent {
  InputFile document;
  InputThumbnail thumbnail;
  FormattedText caption;

  InputMessageDocument(this.document, {this.thumbnail, this.caption});
}

class InputMessageForwarded implements InputMessageContent {
  int fromChatId;
  int messageId;
  bool inGameShare;

  InputMessageForwarded(this.fromChatId, this.messageId,
      {this.inGameShare});
}

class InputMessageGame implements InputMessageContent{
  int botUserId;
  String gameShortName;

  InputMessageGame(this.botUserId, this.gameShortName);
}

class InputMessageInvoice implements InputMessageContent {
  Invoice invoice;
  String title;
  String description;
  String photoUrl;
  int photoSize;
  int photoWidth;
  int photoHeight;
  String payload;
  String providerData;
  String startParameter;

  InputMessageInvoice(this.invoice, this.title,
      this.payload, this.providerData, this.startParameter, {this.description,
        this.photoUrl, this.photoSize, this.photoWidth, this.photoHeight});
}

class InputMessageLocation implements InputMessageContent {
  Location location;
  int livePeriod;

  InputMessageLocation(this.location, this.livePeriod);
}

class InputMessagePhoto implements InputMessageContent {
  InputFile photo;
  InputThumbnail thumbnail;
  List<int> addedStickerFileIds;
  int width;
  int height;
  FormattedText caption;
  int ttl;

  InputMessagePhoto(this.photo, this.width, this.height, {this.thumbnail,
    this.addedStickerFileIds, this.caption, this.ttl = 0});
}

class InputMessageSticker implements InputMessageContent {
  InputFile sticker;
  InputThumbnail thumbnail;
  int width;
  int height;

  InputMessageSticker(this.sticker, this.thumbnail, this.width, this.height);
}

class InputMessageText implements InputMessageContent {
  FormattedText text;
  bool disableWebPagePreview;
  bool clearDraft;

  InputMessageText(this.text,
      {this.disableWebPagePreview = false, this.clearDraft = false});
}

class InputMessageVenue implements InputMessageContent {
  Venue venue;

  InputMessageVenue(this.venue);
}

class InputMessageVideo implements InputMessageContent {
  InputFile video;
  InputThumbnail thumbnail;
  List<int> addedStickerFileIds;
  int duration;
  int width;
  int height;
  bool supportsStreaming;
  FormattedText caption;
  int ttl;

  InputMessageVideo(this.video, this.thumbnail, this.duration,
      this.width, this.height,
      {this.addedStickerFileIds, this.supportsStreaming = true,
      this.caption, this.ttl = 0});
}

class InputMessageVideoNote implements InputMessageContent {
  InputFile videoNote;
  InputThumbnail thumbnail;
  int duration;
  int length;

  InputMessageVideoNote(this.videoNote, this.thumbnail, this.duration,
      this.length);
}

class InputMessageVoiceNote implements InputMessageContent {
  InputFile voiceNote;
  int duration;
  String waveform;
  FormattedText caption;

  InputMessageVoiceNote(this.voiceNote, this.duration, this.waveform,
      {this.caption});
}

class DatedFile {
  File file;
  int date;

  DatedFile(this.file, this.date);
}

class DraftMessage {
  int replyToMessageId;
  InputMessageContent inputMessageText;

  DraftMessage({this.replyToMessageId, this.inputMessageText});
}

class FormattedText {
  String text;
  List<TextEntity> entities;

  FormattedText(this.text, {this.entities = const []});

}

class Location {
  double latitude;
  double longitude;

  Location(this.latitude, this.longitude);
}

abstract class InlineKeyboardButtonType {}

class InlineKeyboardButtonTypeBuy implements InlineKeyboardButtonType{}

class InlineKeyboardButtonTypeCallback implements InlineKeyboardButtonType {
  String data;

  InlineKeyboardButtonTypeCallback({this.data});
}

class InlineKeyboardButtonTypeCallbackGame implements InlineKeyboardButtonType {}

class InlineKeyboardButtonTypeSwitchInline implements InlineKeyboardButtonType {
  String query;
  bool inCurrentChat;

  InlineKeyboardButtonTypeSwitchInline({this.query, this.inCurrentChat});
}

class InlineKeyboardButtonTypeUrl implements InlineKeyboardButtonType {
  String url;

  InlineKeyboardButtonTypeUrl({this.url});
}

class InlineKeyboardButton {
  String text;
  InlineKeyboardButtonType type;
}

class KeyboardButton {
  String text;
  KeyboardButtonType type;
}

abstract class MaskPoint {}

class MaskPointChin implements MaskPoint{}
class MaskPointEyes implements MaskPoint{}
class MaskPointForehead implements MaskPoint{}
class MaskPointMouth implements MaskPoint{}

class MaskPosition {
  MaskPoint point;
  double xShift;
  double yShift;
  double scale;

  MaskPosition(this.point, this.xShift, this.yShift, this.scale);
}

class PhotoSize {
  String type;
  File photo;
  int width;
  int height;

  PhotoSize(this.photo, {this.type, this.width, this.height});
}

abstract class ReplyMarkup {}

class ReplyMarkupForceReply implements ReplyMarkup{
  bool isPersonal;

  ReplyMarkupForceReply({this.isPersonal = false});
}

class ReplyMarkupInlineKeyboard implements ReplyMarkup {
  List<List<InlineKeyboardButton>> rows;

  ReplyMarkupInlineKeyboard({this.rows = const [[]]});
}

class ReplyMarkupRemoveKeyboard implements ReplyMarkup {
  bool isPersonal;

  ReplyMarkupRemoveKeyboard({this.isPersonal});
}

class ReplyMarkupShowKeyboard implements ReplyMarkup {
  List<List<KeyboardButton>> rows;
  bool resizeKeyboard;
  bool oneTime;
  bool isPersonal;

  ReplyMarkupShowKeyboard({this.rows, this.resizeKeyboard, this.oneTime,
    this.isPersonal});
}

class TextEntity {
  int offset;
  int length;
  TextEntityType textEntityType;

  TextEntity(this.offset, this.length, this.textEntityType);
}

class Address {
  String countryCode;
  String state;
  String city;
  String streetLine1;
  String streetLine2;
  String postalCode;

  Address({this.countryCode, this.state, this.city, this.streetLine1,
    this.streetLine2, this.postalCode});
}

class Animation {
  int duration;
  int width;
  int height;
  String fileName;
  String mimeType;
  PhotoSize thumbnail;
  File animation;

  Animation(this.duration, this.width, this.height, this.fileName,
      this.mimeType, this.thumbnail, this.animation);
}

class Audio {
  int duration;
  String title;
  String performer;
  String fileName;
  String mimeType;
  PhotoSize albumCoverThumbnail;
  File audio;

  Audio(this.duration, this.title, this.performer, this.fileName, this.mimeType,
      this.albumCoverThumbnail, this.audio);
}

class Contact{
  String phoneNumber;
  String firstName;
  String lastName;
  String vCard;
  int userId;

  Contact({this.phoneNumber, this.firstName, this.lastName, this.vCard,
    this.userId});
}

class Document {
  String fileName;
  String mimeType;
  PhotoSize thumbnail;
  File document;

  Document({this.fileName, this.mimeType, this.thumbnail, this.document});
}

class EncryptedCredentials {
  String data;
  String hash;
  String secret;

  EncryptedCredentials(this.data, this.hash, this.secret);
}

class EncryptedPassportElement {
  PassportElementType type;
  String data;
  DatedFile frontSide;
  DatedFile backSide;
  DatedFile selfie;
  List<DatedFile> translation;
  List<DatedFile> files;
  String value;
  String hash;

  EncryptedPassportElement(this.type, this.data, this.hash, {
    this.frontSide, this.backSide,
    this.selfie, this.translation = const [], this.files = const [], this.value});
}

class Game {
  int id;
  String shortName;
  String title;
  FormattedText text;
  String description;
  Photo photo;
  Animation animation;

  Game(this.id, this.shortName, {this.title, this.text, this.description,
    this.photo, this.animation});
}

class Invoice {
  String currency;
  List<LabeledPricePart> priceParts;
  bool isTest;
  bool needName;
  bool needPhoneNumber;
  bool needEmailAddress;
  bool needShippingAddress;
  bool sendPhoneNumberToProvider;
  bool sendEmailAddressToProvider;
  bool isFlexible;
}

class LabeledPricePart {
  String label;
  int amount;

  LabeledPricePart(this.label, this.amount);
}

class OrderInfo {
  String name;
  String phoneNumber;
  String emailAddress;
  Address shippingAddress;

  OrderInfo({this.name, this.phoneNumber, this.emailAddress,
    this.shippingAddress});
}

class Photo {
  int id;
  bool hasStickers;
  List<PhotoSize> sizes;
}

class Sticker {
  int setId;
  int width;
  int height;
  String emoji;
  bool isMask;
  MaskPosition maskPosition;
  PhotoSize thumbnail;
  File sticker;

  Sticker({this.setId, this.width, this.height, this.emoji, this.isMask,
    this.maskPosition, this.thumbnail, this.sticker});

}

class Venue {
  Location location;
  String title;
  String address;
  String provider;
  String id;
  String type;

  Venue(this.location, {this.title, this.address, this.provider, this.id,
    this.type});
}

class Video {
  int duration;
  int width;
  int height;
  String fileName;
  String mimeType;
  bool hasTickers;
  bool supportStreaming;
  PhotoSize thumbnail;
  File video;

  Video({this.duration, this.width, this.height, this.fileName, this.mimeType,
    this.hasTickers, this.supportStreaming, this.thumbnail, this.video});
}

class VideoNote {
  int duration;
  int length;
  PhotoSize thumbnail;
  File video;

  VideoNote({this.duration, this.length, this.thumbnail, this.video});
}

class VoiceNote {
  int duration;
  String waveform;
  String mimeType;
  File voice;

  VoiceNote({this.duration, this.waveform, this.mimeType, this.voice});
}

class WebPage {
  String url;
  String displayUrl;
  String type;
  String siteName;
  String title;
  String description;
  Photo photo;
  String embedUrl;
  String embedType;
  int embedWidth;
  int embedHeight;
  int duration;
  int author;
  Animation animation;
  Audio audio;
  Document document;
  Sticker sticker;
  Video video;
  VideoNote videoNote;
  VoiceNote voiceNote;
}
