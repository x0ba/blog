import type { Site, SocialObjects } from "./types";

export const SITE: Site = {
  website: "https://x0ba.lol", // replace this with your deployed domain
  author: "Daniel Xu",
  desc: "I Yap Here.",
  title: "Daniel Xu",
  ogImage: "astropaper-og.jpg",
  lightAndDarkMode: true,
  postPerPage: 3,
};

export const LOCALE = {
  lang: "en", // html lang code. Set this empty and default will be "en"
  langTag: ["en-EN"], // BCP 47 Language Tags. Set this empty [] to use the environment default
} as const;

export const LOGO_IMAGE = {
  enable: false,
  svg: true,
  width: 216,
  height: 46,
};

export const SOCIALS: SocialObjects = [
  {
    name: "Github",
    href: "https://github.com/x0ba",
    linkTitle: ` ${SITE.title} on Github`,
    active: true,
  },
  {
    name: "Mastodon",
    href: "https://social.lol/@dax",
    linkTitle: `${SITE.title} on Mastodon`,
    active: true,
  },
  {
    name: "Mail",
    href: "mailto:hey@x0ba.lol",
    linkTitle: `Send an email to ${SITE.title}`,
    active: true,
  },
  {
    name: "Discord",
    href: "https://discordapp.com/users/532743164553986098",
    linkTitle: `${SITE.title} on Discord`,
    active: true,
  },
  {
    name: "Telegram",
    href: "https://github.com/satnaing/astro-paper",
    linkTitle: `${SITE.title} on Telegram`,
    active: true,
  },
];
