/**
 * @file support command
 * @author Sankarsan Kampa (a.k.a k3rn31p4nic)
 * @license MIT
 */

exports.exec = (Bastion, message) => {
  message.channel.send({
    embed: {
      color: Bastion.colors.GOLD,
      title: 'EeveeOrigins',
      url: 'https://discord.gg/tanzTMF',
      description: 'Need help or support with EeveeOrigins Discord Bot?\nJoin EeveeOrigins Server for any help you need.\nhttps://discord.gg/tanzTMF',
    }
  }).catch(e => {
    Bastion.log.error(e);
  });
};

exports.config = {
  aliases: [ 'ss' ],
  enabled: true
};

exports.help = {
  name: 'support',
  botPermission: '',
  userTextPermission: '',
  userVoicePermission: '',
  usage: 'support',
  example: []
};
