import 'telegram_types.dart';
enum MessageSendingState {
  Pending,
  failed
}

class MessageForwardInfo {
  int forwardedFromChatId;
  int forwardedFromMessageId;

  MessageForwardInfo(this.forwardedFromChatId, this.forwardedFromMessageId);

}

class MessageForwardFromUser extends MessageForwardInfo {
  int senderUserId;
  int date;

  MessageForwardFromUser(
      int forwardedFromChatId,
      int forwardedFromMessageId,
      {
        this.senderUserId,
        this.date
      }
      ) : super(forwardedFromChatId, forwardedFromMessageId);

}

class MessageForwardPost extends MessageForwardInfo {
  int chatId;
  String authorSignature;
  int date;
  int messageId;

  MessageForwardPost(
      int forwardedFromChatId,
      int forwardedFromMessageId,
      {
        this.chatId,
        this.authorSignature,
        this.date,
        this.messageId
      }
      ) : super(forwardedFromChatId, forwardedFromMessageId);


}

class Message {
  int id;
  int senderUserId;
  int chatId;
  MessageSendingState sendingState;
  bool isOutgoing;
  bool canBeEdited;
  bool canBeForwarded;
  bool canBeDeletedForAllUsers;
  bool isChannelPost;
  bool containsUnreadMention;
  int date;
  int editDate;
  int replyToMessageId;
  int ttl;
  double ttlExpires;
  int viaBotUserId;
  String authorSignature;
  int mediaAlbumId;
  MessageContent messageContent;
  ReplyMarkup replyMarkup;

  Message(this.id, this.senderUserId, this.chatId, this.sendingState,
      this.isOutgoing, this.canBeEdited, this.canBeForwarded,
      this.canBeDeletedForAllUsers, this.isChannelPost,
      this.containsUnreadMention, this.date, this.editDate,
      this.replyToMessageId, this.ttl, this.ttlExpires, this.viaBotUserId,
      this.authorSignature, this.mediaAlbumId, this.messageContent,
      this.replyMarkup);
}

abstract class MessageContent {}

class MessageAnimation implements MessageContent {
  Animation animation;
  FormattedText caption;
  bool isSecret;

  MessageAnimation(this.animation, {this.caption, this.isSecret = false});
}

class MessageAudio implements MessageContent {
  Audio audio;
  FormattedText caption;

  MessageAudio(this.audio, this.caption);
}

class MessageBasicGroupChatCreate implements MessageContent {
  String title;
  List<int> memberUserIds;

  MessageBasicGroupChatCreate(this.title, this.memberUserIds);
}

class MessageCall implements MessageContent {
 CallDiscardReason discardReason;
 int duration;

 MessageCall(this.discardReason, this.duration);
}

class MessageChatAddMembers implements MessageContent {
  List<int> memberUserIds;

  MessageChatAddMembers(this.memberUserIds);
}

class MessageChatChangePhoto implements MessageContent {
  Photo photo;

  MessageChatChangePhoto(this.photo);
}

class MessageChatChangeTitle implements MessageContent {
  String title;

  MessageChatChangeTitle(this.title);
}

class MessageChatDeleteMember implements MessageContent {
  int userId;

  MessageChatDeleteMember(this.userId);
}

class MessageChatDeletePhoto implements MessageContent {}

class MessageChatJoinByLink implements MessageContent {}

class MessageChatSetTtl implements MessageContent {
  int ttl;

  MessageChatSetTtl(this.ttl);
}

class MessageChatUpgradeFrom implements MessageContent {
  String title;
  int basicGroupId;

  MessageChatUpgradeFrom(this.title, this.basicGroupId);
}

class MessageChatUpgradeTo implements MessageContent {
  int superGroupId;

  MessageChatUpgradeTo(this.superGroupId);
}

class MessageContact implements MessageContent {
  Contact contact;

  MessageContact(this.contact);
}

class MessageContactRegistered implements MessageContent {}

class MessageCustomServiceAction implements MessageContent {
  String text;

  MessageCustomServiceAction(this.text);
}

class MessageDocument implements MessageContent {
  Document document;
  FormattedText caption;

  MessageDocument(this.document, this.caption);
}

class MessageExpiredPhoto implements MessageContent {}

class MessageExpiredVideo implements MessageContent {}

class MessageGame implements MessageContent {
  Game game;

  MessageGame(this.game);
}

class MessageGameScore implements MessageContent {
  int gameMessageId;
  int gameId;
  int score;

  MessageGameScore(this.gameMessageId, this.gameId, this.score);
}

class MessageInvoice implements MessageContent {
  String title;
  String description;
  String photo;
  String currency;
  int totalAmount;
  String startParameter;
  bool isTest;
  bool needShippingAddress;
  int receiptMessageId;

  MessageInvoice(this.title, this.description, this.photo, this.currency,
      this.totalAmount, this.startParameter, this.isTest,
      this.needShippingAddress, this.receiptMessageId);
}

class MessageLocation implements MessageContent {
  Location location;
  int livePeriod;
  int expiresIn;

  MessageLocation(this.location, this.livePeriod, this.expiresIn);

}

class MessagePassportDataReceived implements MessageContent {
  List<EncryptedPassportElement> elements;
  EncryptedCredentials credentials;

  MessagePassportDataReceived(this.elements, this.credentials);
}

class MessagePassportDataSent implements MessageContent {
  List<EncryptedPassportElement> elements;

  MessagePassportDataSent(this.elements);
}

class MessagePaymentSuccessful implements MessageContent {
  int invoiceMessageId;
  String currency;
  int totalAmount;

  MessagePaymentSuccessful(this.invoiceMessageId, this.currency,
      this.totalAmount);
}

class MessagePaymentSuccessfulBot implements MessageContent {
  int invoiceMessageId;
  String currency;
  int totalAmount;
  String invoicePayload;
  String shippingOptionId;
  OrderInfo orderInfo;
  String telegramPaymentChargeId;
  String providerPaymentChargeId;

  MessagePaymentSuccessfulBot(this.invoiceMessageId, this.currency,
      this.totalAmount, this.invoicePayload, this.shippingOptionId,
      this.orderInfo, this.telegramPaymentChargeId,
      this.providerPaymentChargeId);
}

class MessagePhoto implements MessageContent {
  Photo photo;
  FormattedText caption;
  bool isSecret;

  MessagePhoto(this.photo, this.caption, this.isSecret);
}

class MessagePinMessage implements MessageContent {
  int messageId;

  MessagePinMessage(this.messageId);
}

class MessageScreenshotTaken implements MessageContent {}

class MessageSticker implements MessageContent {
  Sticker sticker;

  MessageSticker(this.sticker);
}

class MessageSupergroupChatCreate implements MessageContent {
  String title;

  MessageSupergroupChatCreate(this.title);
}

class MessageText implements MessageContent {
  FormattedText text;
  WebPage webPage;

  MessageText(this.text, this.webPage);
}

class MessageUnsupported implements MessageContent {}

class MessageVenue implements MessageContent {
  Venue venue;

  MessageVenue(this.venue);
}

class MessageVideo implements MessageContent {
  Video video;
  FormattedText caption;
  bool isSecret;

  MessageVideo(this.video, this.caption, this.isSecret);
}

class MessageVideoNote implements MessageContent {
  VideoNote videoNote;
  bool isViewed;
  bool isSecret;

  MessageVideoNote(this.videoNote, this.isViewed, this.isSecret);
}

class MessageVoiceNote implements MessageContent {
  VoiceNote voiceNote;
  FormattedText caption;
  bool isListened;
}

class MessageWebsiteConnected implements MessageContent {
  String domainName;

  MessageWebsiteConnected(this.domainName);
}
