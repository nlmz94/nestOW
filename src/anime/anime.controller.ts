import { Controller, Get, Param } from '@nestjs/common';
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

	@Get('pagination/:page')
	async getAnimes(@Param('page') page: number) {
		return this.animeService.getAnimes(page);
	}

	@Get('research/:research')
	async researchAnimes(@Param('research') research: string) {
		return this.animeService.researchAnimes(research);
	}

	@Get('count')
	async getPageCount() {
		return this.animeService.getCount();
	}

	@Get('latest')
	async getLatestAnimes() {
		return this.animeService.getLatestAnimes();
	}

	@Get('research/:research/count')
	async getResearchPageCount(@Param('research') research: string) {
		return this.animeService.getResearchCount(research);
	}
}
