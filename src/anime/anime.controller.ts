import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { AnimeService } from './anime.service';

@Controller('anime')
export class AnimeController {
	constructor(private readonly animeService: AnimeService) {}

	@Get()
	async getAll() {
		return this.animeService.getAllAnimes();
	}

	@Get(':id')
	async getById(@Param('id') id: number) {
		return this.animeService.getAnimeById(id);
	}

	@Post()
	async create(@Body() createAnimeDto: CreateAnimeDto) {
		return this.animeService.createAnime(createAnimeDto);
	}

	@Put(':id')
	async update(@Param('id') id: number, @Body() updateAnimeDto: UpdateAnimeDto) {
		return this.animeService.updateAnime(id, updateAnimeDto);
	}

	@Delete(':id')
	async delete(@Param('id') id: number) {
		return this.animeService.deleteAnime(id);
	}
}
