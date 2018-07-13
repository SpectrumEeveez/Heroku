/**
 * @file directMessageHandler
 * @author Sankarsan Kampa (a.k.a k3rn31p4nic)
 * @license MIT
 */

/**
 * Handles direct messages sent to Bastion
 * @param {Message} message Discord.js message object
 * @returns {void}
 */
module.exports = message => {
  let prefix = message.client.config.prefix;

  if (message.content.startsWith(prefix)) {
    let args = message.content.split(' ');
    let command = args.shift().slice(prefix.length).toLowerCase();

    if (command === 'help' || command === 'h') {
      return message.channel.send({
        embed: {
          color: message.client.colors.BLUE,
          title: 'EeveeOrigins_Manager',
          description: 'Join [**EeveeOrigins**](https://discord.gg/mWQgZCv) to test EeveeOrigins and it\'s commands, for giveaway events, for chatting and for a lot of fun!',
          fields: [
            {
              name: 'Discord',
              value: 'Nothing Yet Sorry :( The server this was dedicated for was https://discord.gg/mWQgZCv'
            },
            {
              name: 'EeveeOrigins Invite',
              value: `https://discordapp.com/oauth2/authorize?client_id=${message.client.user.id}&scope=bot&permissions=2146958463`
            }
          ],
          thumbnail: {
            url: message.client.user.displayAvatarURL
          },
          footer: {
            text: '</> with ❤ by Geordie (a.k.a. SpectrumEeveez)'
          }
        }
      }).catch(e => {
        message.client.log.error(e);
      });
    }
  }
};
