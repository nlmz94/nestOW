import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';

@Injectable()
export class AnimeService {
	constructor(private readonly prisma: PrismaService) {}

	async getAllAnimes() {
		return this.prisma.anime.findMany();
	}

	async getAnimeById(id: number) {
		const anime = await this.prisma.anime.findUnique({
			where: { id: +id },
		});

		if (!anime) {
			throw new NotFoundException(`Anime with ID ${id} not found`);
		}

		return anime;
	}

	async getAnimes(page: number) {
		return this.prisma.anime.findMany({
			skip: (page - 1) * 10, // Assuming 10 items per page
			take: 10,
		});
	}

	async getCount() {
		return this.prisma.anime.count();
	}

	async researchAnimes(research: string) {
		return this.prisma.anime.findMany({
			where: {
				OR: [{ title: { contains: research } }, { synopsis: { contains: research } }],
			},
		});
	}

	async researchAnimesPagination(research: string, page: number) {
		return this.prisma.anime.findMany({
			where: {
				OR: [{ title: { contains: research } }, { synopsis: { contains: research } }],
			},
			skip: (page - 1) * 10,
			take: 10,
		});
	}

	async getResearchCount(research: string) {
		return this.prisma.anime.count({
			where: {
				OR: [{ title: { contains: research } }, { synopsis: { contains: research } }],
			},
		});
	}

	// Get the latest animes (sorted by aired date or similar)
	async getLatestAnimes() {
		return this.prisma.anime.findMany({
			orderBy: { aired: 'desc' }, // Assuming 'aired' is a date field
			take: 10, // Limit the result to the latest 10 animes
		});
	}
}
