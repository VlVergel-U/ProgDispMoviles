import { song } from "../models/song.model.js";
import { artist } from "../models/artist.model.js";
import { Op } from 'sequelize';

export const getSong = async (req, res) => {

    const { name } = req.params;

    try {
           const searchSong = await song.findOne({
                where: {
                    name: {
                        [Op.iLike]: '%' + name + '%'
                    }
                },
                attributes: {
                    exclude: ['artistId']
                },
                include: {
                    model: artist,
                    attributes: ['artist_name']
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
                attributes: ['artist_name']
            }
        });

        res.json(allSongs);

    } catch (error) {
        return res.status(500).json({ message: error.nessage });
    }

};