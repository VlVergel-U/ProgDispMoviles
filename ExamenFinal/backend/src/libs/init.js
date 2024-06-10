import { user } from "../models/user.model.js";
import { song } from "../models/song.model.js";
import { artist } from "../models/artist.model.js";

export const createUser = async () => {
  try {
    const userFound = await user.findOne();
    if (userFound) {
      console.log("User already exists");
      return;
    } else {
      const newUser = await user.create({
        first_name: "Daniela",
        second_name: "",
        first_last_name: "Amariz",
        second_last_name: "Torres",
        username: "dani_at23",
        password: "2020",
      });
      console.log("User created and ready");
    }

  } catch (error) {
    console.error(error);
  }
};

export const createSongs = async () => {
  const countSong = await song.count();
  const countArtist = await artist.count();
  let artists;

  if (countArtist === 0) {
      artists = await artist.bulkCreate([
    { name: 'The Weeknd' },
    { name: 'Adele' },
    { name: 'Queen' },
    { name: 'Eagles' },
    { name: 'Tones and I' },
    { name: 'Leonard Cohen' },
    { name: 'Led Zeppelin' },
    { name: 'Ed Sheeran' },
    { name: 'Journey' },
    { name: 'Guns N\' Roses' },
    { name: 'Oasis' },
    { name: 'Imagine Dragons' },
    { name: 'Michael Jackson' },
    { name: 'Johnny Cash' },
    { name: 'Hozier' },
    { name: 'Elvis Presley' },
    { name: 'Nirvana' },
    { name: 'John Legend' },
    { name: 'Pink Floyd' },
  ]);
  console.log("Artists created")
  }

  if (countSong === 0) {
    await song.bulkCreate([
      {
          name: 'Blinding Lights',
          img: 'https://i.scdn.co/image/ab67616d0000b2738863bc11d2aa12b54f5aeb36',
          artistId: artists[0].id,
      },
      {
          name: 'Someone Like You',
          img: 'https://i.scdn.co/image/ab67616d0000b2732118bf9b198b05a95ded6300',
          artistId: artists[1].id,
      },
      {
          name: 'Bohemian Rhapsody',
          img: 'https://upload.wikimedia.org/wikipedia/en/4/4d/Queen_A_Night_At_The_Opera.png',
          artistId: artists[2].id,
      },
      {
          name: 'Hotel California',
          img: 'https://upload.wikimedia.org/wikipedia/en/thumb/4/49/Hotelcalifornia.jpg/220px-Hotelcalifornia.jpg',
          artistId: artists[3].id,
      },
      {
          name: 'Dance Monkey',
          img: 'https://upload.wikimedia.org/wikipedia/en/f/f6/The_Kids_Are_Coming_by_Tones_and_I.png',
          artistId: artists[4].id,
      },
      {
          name: 'Hallelujah',
          img: 'https://upload.wikimedia.org/wikipedia/en/thumb/1/1a/Various_Positions.jpg/220px-Various_Positions.jpg',
          artistId: artists[5].id,
      },
      {
          name: 'Stairway to Heaven',
          img: 'https://sohokulture.com/wp-content/uploads/2023/11/Led-Zeppelin-IV.jpg',
          artistId: artists[6].id,
      },
      {
          name: 'Shape of You',
          img: 'https://upload.wikimedia.org/wikipedia/en/4/45/Divide_cover.png',
          artistId: artists[7].id,
      },
      {
          name: "Don't Stop Believin'",
          img: 'https://upload.wikimedia.org/wikipedia/en/e/e0/JourneyEscapealbumcover.jpg',
          artistId: artists[8].id,
      },
      {
          name: 'Sweet Child o\' Mine',
          img: 'https://psychophonyrecords.com/wp-content/uploads/2022/01/guns-1.jpg',
          artistId: artists[9].id,
      },
      {
          name: 'Wonderwall',
          img: 'https://upload.wikimedia.org/wikipedia/en/b/b1/Oasis_-_%28What%27s_The_Story%29_Morning_Glory_album_cover.jpg',
          artistId: artists[10].id,
      },
      {
          name: 'Radioactive',
          img: 'https://static.qobuz.com/images/covers/4b/f0/zuyerphzzf04b_600.jpg',
          artistId: artists[11].id,
      },
      {
          name: 'Billie Jean',
          img: 'https://www.mehaceruido.com/wp-content/uploads/2018/12/thriller.jpg',
          artistId: artists[12].id,
      },
      {
          name: 'Hurt',
          img: 'https://upload.wikimedia.org/wikipedia/en/e/e0/AmericanIV.jpg',
          artistId: artists[13].id,
      },
      {
          name: 'Take Me to Church',
          img: 'https://upload.wikimedia.org/wikipedia/en/a/a0/Hozier_-_Hozier.png',
          artistId: artists[14].id,
      },
      {
          name: "Can't Help Falling in Love",
          img: 'https://static.qobuz.com/images/covers/98/97/0886445009798_600.jpg',
          artistId: artists[15].id,
      },
      {
          name: 'Smells Like Teen Spirit',
          img: 'https://upload.wikimedia.org/wikipedia/en/b/b7/NirvanaNevermindalbumcover.jpg',
          artistId: artists[16].id,
      },
      {
          name: 'All of Me',
          img: 'https://upload.wikimedia.org/wikipedia/en/6/64/John_Legend_Love_in_the_Future.jpg',
          artistId: artists[17].id,
      },
      {
          name: 'Wish You Were Here',
          img: 'https://www.efeeme.com/wp-content/uploads/pink-floyd-09-01-13-a.jpg',
          artistId: artists[18].id,
      },
  ]);
  console.log("Songs created")

}

console.log("Songs and Artists already created")

};