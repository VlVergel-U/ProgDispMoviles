import { song } from "../models/song.model.js";
import { artist } from "../models/artist.model.js";


export const getSong = async (req, res) => {

    const { name } = req.params;

    try {
           const searchSong = await song.findOne({
                where: { name },
                attributes: {
                    exclude: ['artistId']
                },
                include: {
                    model: artist,
                    attributes: ['name']
                }
            });

        if (!searchSong) {
            return res.status(404).json({ message: "Canción no encontrada" });
        }
        res.json(searchSong);

    } catch (error) {
        return res.status(500).json({ message: error.message });
    }

};

export const getSongs = async (req, res) => {

    try {
        const allSongs = await song.findAll({
            attributes:{
                exclude:['artistId']
            },
            include: {
                model: artist,
                attributes: ['name']
            }
        });

        res.json(allSongs);

    } catch (error) {
        return res.status(500).json({ message: error.nessage });
    }

};